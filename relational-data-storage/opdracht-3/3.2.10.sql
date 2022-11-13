select name, straat, huisnr, postcode from mhl_suppliers where name REGEXP "&[^\s]*;";

-- Ik vond deze op internet, waarom werkt ^\s
-- \s staat voor whitespace
-- ^ voor starten met  ^ 	Starts with 	"^hello"
-- [^abc]	Any character not listed between the square brackets

-- WILDCARD: ^ 	Represents any character not in the brackets 	h[^oa]t finds hit, but not hot and hat