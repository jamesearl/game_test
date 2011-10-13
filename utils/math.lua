
function math.clamp(k, min, max)
	return k < min and min or (k > max and max or k)
end