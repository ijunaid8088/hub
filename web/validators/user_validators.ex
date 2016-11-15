defmodule Hub.UserValidators do
	alias Hub.User

	def validate_token(token) do
		with %Hub.User{} <- User.by_token(token) do
			:ok
		else
			nil ->
				{:invalid}
		end
	end
end