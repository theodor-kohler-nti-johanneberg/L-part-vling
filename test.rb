string = "123"

def onlyHasNumbers?(string)
    return string.to_i.to_s == string

end

p onlyHasNumbers?(string)