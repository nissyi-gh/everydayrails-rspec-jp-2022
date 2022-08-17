require 'rails_helper'

RSpec.describe Note, type: :model do
  it '検索文字列に一致するメモを返すこと' do
    user = User.create(
      first_name: 'Joe',
      last_name: 'Taster',
      email: 'tester@example.com',
      password: 'dottle-nouveau-pavilion-tights-furze',
    )

    project = user.projects.create(name: 'Test Project')

    note1 = project.notes.create(
      message: 'This is first note',
      user: user
    )
    note2 = project.notes.create(
      message: 'This is second note',
      user: user
    ) 
    note3 = project.notes.create(
      message: 'First, preheat the oven.',
      user: user
    )

    expect(Note.search('first')).to include(note1, note3)
    expect(Note.search('first')).to_not include(note2)
  end

  it '検証結果が一件も見つからなければ空のコレクションを返すこと' do
    user = User.create(
      first_name: 'Joe',
      last_name: 'Taster',
      email: 'tester@example.com',
      password: 'dottle-nouveau-pavilion-tights-furze',
    )

    project = user.projects.create(name: 'Test Project')

    note1 = project.notes.create(
      message: 'This is first note',
      user: user
    )
    note2 = project.notes.create(
      message: 'This is second note',
      user: user
    ) 
    note3 = project.notes.create(
      message: 'First, preheat the oven.',
      user: user
    )

    expect(Note.search('message')).to be_empty
  end
end
