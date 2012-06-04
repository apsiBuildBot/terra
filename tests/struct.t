--the zero line
struct A { b : B }
struct B {a : int, b : int }

terra bar(a : B)
	a.a = a.a + 1
	return a,3
end

terra foo()
	var a : B
	a.a = 4;
	--(bar(a)).a = 3, TODO: why is the offset == 0 for this value?
	var c,d = bar(a)
	return c.a + a.a + d
end

terra baz(a : &B)
	(@a).a = 1;
	(@a).b = 2;
end

terra foo2()
	var a : B
	baz(&a)
	return a.a + a.b
end
local test = require("test")

test.eq(foo(),12)
test.eq(foo2(),3)

