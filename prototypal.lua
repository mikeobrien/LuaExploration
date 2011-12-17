require 'lunatest'

function test_should_create_object_with_some_elements()
   person = {}
   person.name = 'Ernst Mach'
   person['occupation'] = 'physicist, philosopher'
   assert_equal('Ernst Mach', person['name'])
   assert_equal('physicist, philosopher', person.occupation)
end

function test_should_execute_self_method()
	greeting = { hello = 'hai' }
	function greeting:say_hi()
		return 'oh ' .. self.hello
	end
	assert_equal('oh hai', greeting:say_hi())
end

function test_should_set_object_prototype()
	Greeting = { hello = 'hello' }
	function Greeting:new(o)
		o = o or {}
		setmetatable(o, o)
		o.__index = self
		return o
	end
	lolcat = Greeting:new{ hello = 'hai' }
	assert_equal('hai', lolcat.hello)
end

lunatest.run()