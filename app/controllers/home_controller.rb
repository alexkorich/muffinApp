class HomeController < ApplicationController
def index
	@menu=Menu.all
end
end
