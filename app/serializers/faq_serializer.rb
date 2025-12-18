class FaqSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer, :position
end
