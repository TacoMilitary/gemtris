# frozen_string_literal: false

# Encapsulates the logic of a single square on the coordinate grid.
class Cell
  CELL_VISUAL_SIZE = 3
  EMPTY_CELL_VISUAL = '-'.freeze
  FILLED_CELL_VISUAL = '[ ]'.freeze
  CENTER_CELL_VISUAL = '[+]'.freeze
  SHADOW_CELL_VISUAL = '( )'.freeze
  SOLID_CELL_VISUAL = '[=]'.freeze

  attr_reader :solid

  def initialize
    clear
  end

  def to_s
    visual.center CELL_VISUAL_SIZE
  end

  def clear
    self.solid = false
    self.visual = EMPTY_CELL_VISUAL
  end

  def shape_fill
    self.visual = FILLED_CELL_VISUAL
  end

  def shape_center_fill
    self.visual = CENTER_CELL_VISUAL
  end

  def shade
    self.visual = SHADOW_CELL_VISUAL
  end

  def solidify
    self.solid = true
    self.visual = SOLID_CELL_VISUAL
  end

  def solid?
    @solid
  end

  private

  attr_writer :solid

  attr_accessor :visual
end