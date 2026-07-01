extends Control

const BIP39_PATH: String = "res://Assets/Words/BIP39.txt"
const NUM_WORDS_12: int = 12
const NUM_WORDS_24: int = 24

@onready var milli_label : Label = $Margin/Content/ClockRow/MilliLabel
@onready var god_says_label : RichTextLabel = $Margin/Content/LogBox/LogVBox/GodSays
@onready var latest_seed_label : RichTextLabel = $Margin/Content/LatestPanel/LatestVBox/PhraseRow/LatestSeed
@onready var latest_title : Label = $Margin/Content/LatestPanel/LatestVBox/LatestTitle
@onready var copy_seed_btn : Button = $Margin/Content/LatestPanel/LatestVBox/PhraseRow/CopySeedBtn

@onready var song_audio_player : AudioStreamPlayer = $Song
@onready var sfx_player: TempleSFX = $SFX

var bip39_words : PackedStringArray = []

var seed_int : int = 0
var random : RandomNumberGenerator = RandomNumberGenerator.new()
var last_revealed_seed : String = ""


func _ready() -> void:
	await RenderingServer.frame_post_draw
	var game_name = ProjectSettings.get_setting("application/config/name")
	DisplayServer.window_set_title(game_name, get_window().get_window_id())
	
	var bip_file: FileAccess = FileAccess.open(BIP39_PATH, FileAccess.READ)
	while not bip_file.eof_reached():
		var line: String = bip_file.get_line().strip_edges()
		if line.length() > 0:
			bip39_words.append(line)
	bip_file.close()
	
	await get_tree().create_timer(1).timeout
	song_audio_player.play()
	
	# Initial divine message (clean for new UI)
	god_says_label.add_text("The LORD speaks: \"I control the random numbers of the universe.\"\n")
	god_says_label.add_text("Green box = latest clean phrase (use COPY). Red log = My messages, words & fragments (press WORD to append).\n")
	god_says_label.add_text("To test in Electrum: Copy phrase → Create/Standard wallet → \"I already have a seed\" → paste. Fun/education only.\n")
	god_says_label.add_text("Test worthiness (F8) for rare special revelations.\n\n")
	latest_seed_label.text = "[Awaiting the LORD's word...]"


func _process(_delta: float) -> void:
	var now_unix = Time.get_unix_time_from_system()
	
	seed_int = int(now_unix * 1000.0)
	milli_label.text = str(seed_int)

	if Input.is_action_just_pressed("DivineGuess"):
		_on_12_word_guess_pressed()
	elif Input.is_action_just_pressed("Divine24"):
		_on_24_word_revelation_pressed()
	elif Input.is_action_just_pressed("DivineWord"):
		_on_divine_word_pressed()
	elif Input.is_action_just_pressed("WorthyTest"):
		_on_worthy_test_pressed()
	elif Input.is_action_just_pressed("Clear"):
		_on_clear_pressed()
	elif Input.is_key_pressed(KEY_C) and (Input.is_key_pressed(KEY_CTRL) or Input.is_key_pressed(KEY_META)):
		_on_copy_seed_pressed()


func _generate_seed_phrase(num_words: int) -> String:
	random.seed = seed_int
	var words: Array[String] = []
	for i in range(num_words):
		var idx: int = random.randi() % bip39_words.size()
		words.append(bip39_words[idx])
	return " ".join(words)

func _format_phrase_for_display(phrase: String) -> String:
	# Break into lines of ~6-7 words for clean readable display in the latest box
	var words = phrase.split(" ")
	var lines: Array[String] = []
	var current: Array[String] = []
	for w in words:
		current.append(w)
		if current.size() >= 7:
			lines.append(" ".join(current))
			current.clear()
	if current.size() > 0:
		lines.append(" ".join(current))
	return "\n".join(lines)


func _on_divine_word_pressed() -> void:
	random.seed = seed_int
	var word: String = bip39_words[random.randi() % bip39_words.size()]
	latest_seed_label.text = word
	last_revealed_seed = word
	god_says_label.add_text(word + " ")
	sfx_player.play_beep(300, 0.025, 0.05)


func _on_12_word_guess_pressed() -> void:
	var phrase: String = _generate_seed_phrase(NUM_WORDS_12)
	last_revealed_seed = phrase
	latest_seed_label.text = _format_phrase_for_display(phrase)
	god_says_label.add_text("\n[12-WORD DIVINE GUESS GRANTED at " + str(seed_int) + " — see green box above]\n")
	sfx_player.play_beep(420, 0.18, 0.09)


func _on_24_word_revelation_pressed() -> void:
	var phrase: String = _generate_seed_phrase(NUM_WORDS_24)
	last_revealed_seed = phrase
	latest_seed_label.text = _format_phrase_for_display(phrase)
	god_says_label.add_text("\n[24-WORD HOLY REVELATION GRANTED at " + str(seed_int) + " — see green box above]\n")
	sfx_player.play_beep(380, 0.28, 0.09)


func _on_worthy_test_pressed() -> void:
	random.seed = seed_int
	var roll: int = random.randi() % 69000
	god_says_label.add_text("\n[TESTING WORTHINESS AT " + str(seed_int) + " ... roll=" + str(roll) + " (1 in 69000 chance)]\n")
	
	if roll == 0:  # exactly 1/69000 "worthy" moment
		var special_phrase: String = _generate_seed_phrase(12)
		last_revealed_seed = special_phrase
		latest_seed_label.text = _format_phrase_for_display(special_phrase)
		god_says_label.add_text("!!! THE HOLY SPIRIT DEEMS YOU WORTHY at " + str(seed_int) + " !!!\n")
		god_says_label.add_text("A full seed phrase was granted — see the green box above.\n")
		god_says_label.add_text("\"Guard it well, for the blockchain remembers all. The coins are not yours to claim lightly.\"\n")
		sfx_player.play_beep(880, 0.5, 0.2)
	else:
		god_says_label.add_text("The LORD says: \"You are not yet worthy. Faith and patience, child.\"\n")
		sfx_player.play_beep(180, 0.08, 0.03)


func _on_clear_pressed() -> void:
	god_says_label.text = ""
	latest_seed_label.text = "[Awaiting the LORD's word...]"
	last_revealed_seed = ""
	sfx_player.play_beep(500, 0.1, 0.05)


func _on_copy_seed_pressed() -> void:
	if last_revealed_seed.length() > 0:
		DisplayServer.clipboard_set(last_revealed_seed)
		sfx_player.play_beep(1500, 0.06, 0.06)
