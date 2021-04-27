EVENT_START_HOUR = 9.freeze
EVENT_END_HOUR = 22.freeze

namespace :events do
  desc "control events"
  task create_toweek: :environment do
    today = Date.today

    [*today.beginning_of_week..today.end_of_week].each do |date|
      [*EVENT_START_HOUR..EVENT_END_HOUR].each do |hour|
        Event.find_or_create_by(
            title: '◎',
            description: '予約可能',
            start: DateTime.new(date.year, date.month, date.day, hour, 0, 0),
            end: DateTime.new(date.year, date.month, date.day, hour, 30, 0),
            chiropractor_id: 1
          )
        Event.find_or_create_by(
            title: '◎',
            description: '予約可能',
            start: DateTime.new(date.year, date.month, date.day, hour, 30, 0),
            end: DateTime.new(date.year, date.month, date.day, hour+1, 0, 0),
            chiropractor_id: 1
          )
        Event.find_or_create_by(
            title: '◎',
            description: '予約可能',
            start: DateTime.new(date.year, date.month, date.day, hour, 0, 0),
            end: DateTime.new(date.year, date.month, date.day, hour, 30, 0),
            chiropractor_id: 2
          )
        Event.find_or_create_by(
            title: '◎',
            description: '予約可能',
            start: DateTime.new(date.year, date.month, date.day, hour, 30, 0),
            end: DateTime.new(date.year, date.month, date.day, hour+1, 0, 0),
            chiropractor_id: 2
          )
        Event.find_or_create_by(
            title: '◎',
            description: '予約可能',
            start: DateTime.new(date.year, date.month, date.day, hour, 0, 0),
            end: DateTime.new(date.year, date.month, date.day, hour, 30, 0),
            chiropractor_id: 3
          )
        Event.find_or_create_by(
            title: '◎',
            description: '予約可能',
            start: DateTime.new(date.year, date.month, date.day, hour, 30, 0),
            end: DateTime.new(date.year, date.month, date.day, hour+1, 0, 0),
            chiropractor_id: 3
          )
        Event.find_or_create_by(
            title: '◎',
            description: '予約可能',
            start: DateTime.new(date.year, date.month, date.day, hour, 0, 0),
            end: DateTime.new(date.year, date.month, date.day, hour, 30, 0),
            chiropractor_id: 4
          )
        Event.find_or_create_by(
            title: '◎',
            description: '予約可能',
            start: DateTime.new(date.year, date.month, date.day, hour, 30, 0),
            end: DateTime.new(date.year, date.month, date.day, hour+1, 0, 0),
            chiropractor_id: 4
          )
      end
    end
  end
end
