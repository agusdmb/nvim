local function generateAsciiArt(input)
	-- Convert input to uppercase
	input = input:upper()

	-- Define the ASCII art characters for each letter
	local characters = {
		["A"] = {
			" █████╗ ",
			"██╔══██╗",
			"███████║",
			"██╔══██║",
			"██║  ██║",
			"╚═╝  ╚═╝",
		},
		["B"] = {
			"██████╗ ",
			"██╔══██╗",
			"██████╔╝",
			"██╔══██╗",
			"██████╔╝",
			"╚═════╝ ",
		},
		["C"] = {
			" ██████╗",
			"██╔════╝",
			"██║     ",
			"██║     ",
			"╚██████╗",
			" ╚═════╝",
		},
		["D"] = {
			"██████╗ ",
			"██╔══██╗",
			"██║  ██║",
			"██║  ██║",
			"██████╔╝",
			"╚═════╝ ",
		},
		["E"] = {
			"███████╗",
			"██╔════╝",
			"█████╗  ",
			"██╔══╝  ",
			"███████╗",
			"╚══════╝",
		},
		["F"] = {
			"███████╗",
			"██╔════╝",
			"█████╗  ",
			"██╔══╝  ",
			"██║     ",
			"╚═╝     ",
		},
		["G"] = {
			" ██████╗ ",
			"██╔════╝ ",
			"██║  ███╗",
			"██║   ██║",
			"╚██████╔╝",
			" ╚═════╝ ",
		},
		["H"] = {
			"██╗  ██╗",
			"██║  ██║",
			"███████║",
			"██╔══██║",
			"██║  ██║",
			"╚═╝  ╚═╝",
		},
		["I"] = {
			"██╗",
			"██║",
			"██║",
			"██║",
			"██║",
			"╚═╝",
		},
		["J"] = {
			"     ██╗",
			"     ██║",
			"     ██║",
			"██   ██║",
			"╚█████╔╝",
			" ╚════╝ ",
		},
		["K"] = {
			"██╗  ██╗",
			"██║ ██╔╝",
			"█████╔╝ ",
			"██╔═██╗ ",
			"██║  ██╗",
			"╚═╝  ╚═╝",
		},
		["L"] = {
			"██╗     ",
			"██║     ",
			"██║     ",
			"██║     ",
			"███████╗",
			"╚══════╝",
		},
		["M"] = {
			"███╗   ███╗",
			"████╗ ████║",
			"██╔████╔██║",
			"██║╚██╔╝██║",
			"██║ ╚═╝ ██║",
			"╚═╝     ╚═╝",
		},
		["N"] = {
			"███╗   ██╗",
			"████╗  ██║",
			"██╔██╗ ██║",
			"██║╚██╗██║",
			"██║ ╚████║",
			"╚═╝  ╚═══╝",
		},
		["O"] = {
			" ██████╗ ",
			"██╔═══██╗",
			"██║   ██║",
			"██║   ██║",
			"╚██████╔╝",
			" ╚═════╝ ",
		},
		["P"] = {
			"██████╗ ",
			"██╔══██╗",
			"██████╔╝",
			"██╔═══╝ ",
			"██║     ",
			"╚═╝     ",
		},
		["Q"] = {
			" ██████╗ ",
			"██╔═══██╗",
			"██║   ██║",
			"██║▄▄ ██║",
			"╚██████╔╝",
			" ╚══▀▀═╝ ",
		},
		["R"] = {
			"██████╗ ",
			"██╔══██╗",
			"██████╔╝",
			"██╔══██╗",
			"██║  ██║",
			"╚═╝  ╚═╝",
		},
		["S"] = {
			"███████╗",
			"██╔════╝",
			"███████╗",
			"╚════██║",
			"███████║",
			"╚══════╝",
		},
		["T"] = {
			"████████╗",
			"╚══██╔══╝",
			"   ██║   ",
			"   ██║   ",
			"   ██║   ",
			"   ╚═╝   ",
		},
		["U"] = {
			"██╗   ██╗",
			"██║   ██║",
			"██║   ██║",
			"██║   ██║",
			"╚██████╔╝",
			" ╚═════╝ ",
		},
		["V"] = {
			"██╗   ██╗",
			"██║   ██║",
			"██║   ██║",
			"╚██╗ ██╔╝",
			" ╚████╔╝ ",
			"  ╚═══╝  ",
		},
		["W"] = {
			"██╗    ██╗",
			"██║    ██║",
			"██║ █╗ ██║",
			"██║███╗██║",
			"╚███╔███╔╝",
			" ╚══╝╚══╝ ",
		},
		["X"] = {
			"██╗  ██╗",
			"╚██╗██╔╝",
			" ╚███╔╝ ",
			" ██╔██╗ ",
			"██╔╝ ██╗",
			"╚═╝  ╚═╝",
		},
		["Y"] = {
			"██╗   ██╗",
			"╚██╗ ██╔╝",
			" ╚████╔╝ ",
			"  ╚██╔╝  ",
			"   ██║   ",
			"   ╚═╝   ",
		},
		["Z"] = {
			"███████╗",
			"╚══███╔╝",
			"  ███╔╝ ",
			" ███╔╝  ",
			"███████╗",
			"╚══════╝",
		},
		[" "] = {
			"        ",
			"        ",
			"        ",
			"        ",
			"        ",
			"        ",
		},
		["0"] = {
			" ██████╗ ",
			"██╔═████╗",
			"██║██╔██║",
			"████╔╝██║",
			"╚██████╔╝",
			" ╚═════╝ ",
		},
		["1"] = {
			"  ██╗",
			" ███║",
			" ╚██║",
			"  ██║",
			"  ██║",
			"  ╚═╝",
		},
		["2"] = {
			"██████╗ ",
			"╚════██╗",
			" █████╔╝",
			"██╔═══╝ ",
			"███████╗",
			"╚══════╝",
		},
		["3"] = {
			"██████╗ ",
			"╚════██╗",
			" █████╔╝",
			" ╚═══██╗",
			"██████╔╝",
			"╚═════╝ ",
		},
		["4"] = {
			"██╗  ██╗",
			"██║  ██║",
			"███████║",
			"╚════██║",
			"     ██║",
			"     ╚═╝",
		},
		["5"] = {
			"███████╗",
			"██╔════╝",
			"███████╗",
			"╚════██║",
			"███████║",
			"╚══════╝",
		},
		["6"] = {
			" ██████╗ ",
			"██╔════╝ ",
			"███████╗ ",
			"██╔═══██╗",
			"╚██████╔╝",
			" ╚═════╝ ",
		},
		["7"] = {
			"███████╗",
			"╚════██║",
			"    ██╔╝",
			"   ██╔╝ ",
			"   ██║  ",
			"   ╚═╝  ",
		},
		["8"] = {
			" █████╗ ",
			"██╔══██╗",
			"╚█████╔╝",
			"██╔══██╗",
			"╚█████╔╝",
			" ╚════╝ ",
		},
		["9"] = {
			" █████╗ ",
			"██╔══██╗",
			"╚██████║",
			" ╚═══██║",
			" █████╔╝",
			" ╚════╝ ",
		},
	}

	-- Generate ASCII art for each character in the input string
	local output = {}
	for _, char in ipairs({ input:byte(1, -1) }) do
		local asciiChar = string.char(char)
		local art = characters[asciiChar] or {}
		for i, line in ipairs(art) do
			output[i] = (output[i] or "") .. line
		end
	end

	-- Return the ASCII art as a table of strings
	return output
end

-- Example usage
local input = "wednesday"
local asciiArt = generateAsciiArt(input)
for _, line in ipairs(asciiArt) do
	print(line)
end