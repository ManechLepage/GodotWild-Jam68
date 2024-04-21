extends Node



var quotes = [
"I’ve explored far and wide for these fine technological crafts, so use them wisely and with care.", 
"Have you seen my son?\n… \nHe’s a disappointment.",
"Ah, how I reminisce on my glory days… \nI used to be very famous, you know.", 
"I think I’m beginning to develop early onset dementia…",
"Behold, my greatest invention \nThe air conditioner.",
"Pat is short for Patricius Atomicus Terrace III.",
"They say I am the reincarnation of Einstein. \nPersonally, I think I’m closer to God.",
"Over the years, I have accumulated unimaginable amounts of knowledge of the cosmos.\nI’ve been on countless expeditions to all sorts of places.",
"I will never give you up.",
"These ship parts shall never let you down.",
"I like taking long walks on the beach and watching the sunset.",
"Pat is win",
"Rock and Stone! \nThat’s what they said when they tried getting diamonds.",
"Did you know? Buying things from my shop makes you popular and cool. \nI don’t make the rules.",
"Once upon a time, I skipped school for 2 days. \nThose two days are now called Saturday and Sunday",
"I drown sharks when they annoy me \nDon’t ask how.",
"Get your sunglasses on… They say I'm dazzling."
]

func get_quote():
	return quotes[randi() % quotes.size()]
