/// Sorts persistent map JSON saves
/proc/cmp_persistent_saves_asc(A, B)
	// copytext drops the ".json" from the end of the string
	A = copytext(A, 1, -5)
	B = copytext(B, 1, -5)
	return text2num(A) - text2num(B)
