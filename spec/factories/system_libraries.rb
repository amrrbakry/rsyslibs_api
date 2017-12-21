FactoryBot.define do
  factory :system_library do
    name 'syslib'
    version '0.1.0'
    os 'darwin16'
    os_bits 64
    os_vendor 'apple'
  end
end
