class Reservation < ActiveRecord::Base
belongs_to :user
belongs_to :reserve, :class_name => "User"

DATE_REGEX = /\A(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})\z/
TIME_REGEX = /\A([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]\z/
validates :ResName, :presence => true
validates :date, :presence => true, :format => DATE_REGEX
validates :time, :presence => true, :format => TIME_REGEX
validates :duration, :presence => true, :format => TIME_REGEX
validates :table, :presence => true
end
