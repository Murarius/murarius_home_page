# class Message
class Message
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include GlobalID::Identification

  include Humanizer
  attr_accessor :bypass_humanizer
  require_human_on nil, unless: :bypass_humanizer

  attr_accessor :from
  attr_accessor :subject
  attr_accessor :content

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/
  validates :from, presence: true, format: { with: VALID_EMAIL_REGEX, multiline: true }

  validates :subject, presence: true
  validates :content, presence: true
  validates :humanizer_answer, presence: true
  # validates :humanizer_check_answer

  @all = []
  def self.all
    @all
  end

  def initialize(bypass_humanizer, message = {})
    @bypass_humanizer = bypass_humanizer
    @from = message[:from]
    @subject = message[:subject]
    @content = message[:content]
    @humanizer_question_id = message[:humanizer_question_id]
    @humanizer_answer = message[:humanizer_answer]
    self.class.all << self
  end

  def persisted?
    false
  end

  def self.find(id)
    all.detect { |item| item.id.to_s == id.to_s }
  end

  def id
    object_id
  end
end
