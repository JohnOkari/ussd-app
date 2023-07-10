class UssdController < ApplicationController
    def handle_ussd
      session_id = params[:sessionId]
      phone_number = params[:phoneNumber]
      text = params[:text]
  
      # Retrieve user session from the database or session variables
      user_session = UserSession.find_or_create_by(session_id: session_id, phone_number: phone_number)
      current_state = user_session.current_state
  
      if current_state.nil?
        # Initial state
        response_text = "Welcome to My USSD App! Please enter your name:"
        user_session.update(current_state: :enter_name)
      elsif current_state == "enter_name"
        # User entered their name
        name = text.strip
        response_text = "Hello, #{name}! How can I assist you today?"
        user_session.update(current_state: :main_menu)
      elsif current_state == "main_menu"
        # User is in the main menu
        case text.strip.downcase
        when "1"
          response_text = "You selected Option 1. What would you like to do next?"
          user_session.update(current_state: :submenu_option_1)
        when "2"
          response_text = "You selected Option 2. What would you like to do next?"
          user_session.update(current_state: :submenu_option_2)
        else
          response_text = "Invalid input. Please select a valid option."
        end
      elsif current_state == "submenu_option_1"
        # User is in submenu option 1
        # Handle the logic for submenu option 1
        response_text = "Submenu Option 1 executed. What would you like to do next?"
        user_session.update(current_state: :main_menu)
      elsif current_state == "submenu_option_2"
        # User is in submenu option 2
        # Handle the logic for submenu option 2
        response_text = "Submenu Option 2 executed. What would you like to do next?"
        user_session.update(current_state: :main_menu)
      else
        response_text = "Invalid state. Please try again."
        user_session.update(current_state: :main_menu)
      end
  
      render xml: build_response(response_text)
    end
  
    private
  
    def build_response(text)
      # Build the XML response conforming to the USSD protocol
      response = Builder::XmlMarkup.new
      response.instruct!(:xml, version: "1.0", encoding: "UTF-8")
      response.USSD do |ussd|
        ussd.Message text
        ussd.Action url_for(controller: "ussd", action: "handle_ussd", host: request.host_with_port)
      end
    end
  end
  