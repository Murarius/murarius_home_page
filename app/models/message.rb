# class Message
class Message
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include GlobalID::Identification

  attr_accessor :from
  attr_accessor :subject
  attr_accessor :content

  validates :from, presence: true
  validates :subject, presence: true
  validates :content, presence: true

  @all = []
  def self.all
    @all
  end

  def initialize(from = nil, subject = nil, content = nil)
    @from = from
    @subject = subject
    @content = content
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
