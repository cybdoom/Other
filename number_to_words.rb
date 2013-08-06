# encoding: utf-8
GROUP_ROOTS = ['тисяч', 'долар']

DIGITS_AS_WORDS =
[
  ['', '', ''],
  ['сто', 'десять', ['одна', 'один']],
  ['двісті', 'двадцять', ['дві', 'два']],
  ['триста', 'тридцять', 'три'],
  ['чотириста', 'сорок', 'чотири'],
  ['п\'ятсот', 'п\'ятдесят', 'п\'ять'],
  ['шістсот', 'шістдесят', 'шість'],
  ['сімсот', 'сімдесят', 'сім'],
  ['вісімсот', 'вісімдесят', 'вісім'],
  ['дев\'ятсот', 'дев\'яносто', 'дев\'ять'],
  'десять',
  'одинадцять',
  'дванадцять',
  'тринадцять',
  'чотирнадцять',
  'п\'ятнадцять',
  'шістнадцять',
  'сімадцять',
  'вісімнадцять',
  'дев\'ятнадцять'
]

def get_group_ending group
  # 123 = d1_d2_d3
  d1 = group / 100
  d2 = (group / 10) % 10
  d3 = group % 10

  if d2 == 1
    ['', 'ів']
  else
    case d3
      when 1
        ['а', '']
      when 2..4
        ['і', 'и']
      else
        ['', 'ів']
    end
  end
end

def digit_group_to_words group, index
  d1 = group / 100
  d2 = (group / 10) % 10
  d3 = group % 10

  result = DIGITS_AS_WORDS[d1][0]
  if d2 != 1 then
    result += (result.empty? ? '' : ' ') + DIGITS_AS_WORDS[d2][1] if DIGITS_AS_WORDS[d2][1] != ''
    last_part = DIGITS_AS_WORDS[d3][2].class == Array ? DIGITS_AS_WORDS[d3][2][index] : DIGITS_AS_WORDS[d3][2]
    result += (result.empty? ? '' : ' ') + last_part if last_part != ''
  else
    result += (result.empty? ? '' : ' ') + DIGITS_AS_WORDS[10 + d3]
  end
  result += ' ' + GROUP_ROOTS[index] + get_group_ending(group)[index]
end

def number_to_words number
  groups = []
  str = number.to_s

  j = 0
  current_group = ''

  (str.size - 1).downto(0) do |i|
    current_group = str[i] + current_group
    j += 1
    if j % 3 == 0 || i == 0
      j = 0
      groups.unshift current_group.to_i
      current_group = ''
    end
  end

  j = -1
  groups.map do |group|
    j += 1
    digit_group_to_words(group, GROUP_ROOTS.size - groups.size + j)
  end.join(' ')
end

puts number_to_words ARGV[0]
