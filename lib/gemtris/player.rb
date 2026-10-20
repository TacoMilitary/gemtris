# frozen_string_literal: false

require_relative 'utils'

# Used to encapsulate player logic.
class Player
  INVALID_ACTION = 'That is not a valid action!'.freeze

  FALL_ACTION = :fall
  MOVE_LEFT_ACTION = :move_left
  MOVE_RIGHT_ACTION = :move_right
  ROTATE_CLOCKWISE_ACTION = :rotate_clockwise
  ROTATE_COUNTER_ACTION = :rotate_counter_clockwise
  FREEFALL_ACTION = :freefall

  PLAY_AGAIN_CHOICE = 'yes'.freeze

  INPUTS_FOR_ACTIONS = {
    ['<', ','] => MOVE_LEFT_ACTION,
    ['>', '.'] => MOVE_RIGHT_ACTION,
    ['d'] => ROTATE_COUNTER_ACTION,
    ['a'] => ROTATE_CLOCKWISE_ACTION,
    ['s'] => FREEFALL_ACTION
  }.freeze

  ACTION_PROMPT = format(
    GemtrisText[:tetromino_control_prompt],
    *INPUTS_FOR_ACTIONS.keys.flatten
  )

  def prompt_tetromino_action
    puts ACTION_PROMPT
    CLI.divide_screen

    loop do
      action = find_action(CLI.user_input)
      return action if action

      CLI.error(INVALID_ACTION)
    end
  end

  def play_again?
    answer = CLI.prompt GemtrisText[:play_again]
    answered_yes?(answer)
  end

  private

  def answered_yes?(answer)
    PLAY_AGAIN_CHOICE.start_with?(answer) ||
      answer.start_with?(PLAY_AGAIN_CHOICE)
  end

  def find_action(player_input)
    return FALL_ACTION if player_input.empty?

    INPUTS_FOR_ACTIONS.each_key do |input_list|
      return INPUTS_FOR_ACTIONS[input_list] if input_list.include? player_input
    end

    nil
  end
end
