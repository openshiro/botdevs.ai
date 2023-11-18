# Random developers
RANDOM_DEVELOPERS = 20
if Developer.count < RANDOM_DEVELOPERS
  (RANDOM_DEVELOPERS - Developer.count).times do
    SeedsHelper.create_random_developer!
  end
end

# Minimum developer
SeedsHelper.create_developer!("minimum", {
  hero: "Minimum AI/ML developer",
  location: SeedsHelper.locations[:new_york]
})

# Invisible electrician
developer = SeedsHelper.create_developer!("invisible", {
  hero: "Invisible Electrician",
  location: SeedsHelper.locations[:new_york]
})
developer.invisiblize_and_notify! unless developer.invisible?

# Stale developer
developer = SeedsHelper.create_developer!("stale", {
  hero: "Stale AI/ML developer",
  location: SeedsHelper.locations[:new_york]
})
long_time_ago = 31.days.ago
developer.update!(created_at: long_time_ago, updated_at: long_time_ago)
developer.notify_as_stale unless Notification.exists?(type: Developers::ProfileReminderNotification.name)

# Featured developer
developer = SeedsHelper.create_developer!("featured", {
  hero: "Featured AI/ML developer",
  location: SeedsHelper.locations[:new_york]
})
developer.feature! unless developer.featured_at?

# Junior developer
SeedsHelper.create_developer!("entry_level", {
  hero: "Entry-level AI/ML developer",
  location: SeedsHelper.locations[:new_york],
  search_status: :actively_looking,
  role_type: RoleType.new(full_time_employment: true),
  role_level: RoleLevel.new(entry_level: true)
})

# Freelancer developer
SeedsHelper.create_developer!("freelancer", {
  hero: "Contract Electrician",
  location: SeedsHelper.locations[:new_york],
  search_status: :open,
  role_type: RoleType.new(part_time_contract: true),
  role_level: RoleLevel.new(apprentice: true, journeyman: true),
  website: Faker::Internet.url,
  github: Faker::Internet.username
})

# Core developer
developer = SeedsHelper.create_developer!("developer", {
  hero: "Top Electrician",
  location: SeedsHelper.locations[:new_york],
  search_status: :actively_looking,
  role_type: RoleType.new(RoleType::TYPES.map { |t| [t, true] }.to_h),
  role_level: RoleLevel.new(RoleLevel::TYPES.map { |t| [t, true] }.to_h),
  website: Faker::Internet.url,
  github: Faker::Internet.username,
  twitter: Faker::Internet.username,
  mastodon: Faker::Internet.url,
  linkedin: Faker::Internet.username,
  stack_overflow: Faker::Number.number(digits: 6),
  scheduling_link: Faker::Internet.url
})
developer.send_product_announcement unless Notification.exists?(type: Developers::ProductAnnouncementNotification.name)

# Potential hire
developer = SeedsHelper.create_developer!("hired", {
  hero: "Hired Electrician",
  location: SeedsHelper.locations[:new_york],
  search_status: :actively_looking,
  role_type: RoleType.new(RoleType::TYPES.map { |t| [t, true] }.to_h),
  role_level: RoleLevel.new(RoleLevel::TYPES.map { |t| [t, true] }.to_h)
})
developer.update_and_notify(search_status: :not_interested) unless developer.not_interested?

# New developer
SeedsHelper.create_developer!("new", {
  hero: "New AI/ML developer",
  location: SeedsHelper.locations[:new_york],
  search_status: :actively_looking,
  created_at: Time.current
})

# Recently updated developer
SeedsHelper.create_developer!("updated", {
  hero: "Recently Updated AI/ML developer",
  location: SeedsHelper.locations[:new_york],
  search_status: :actively_looking,
  profile_updated_at: Time.current
})
