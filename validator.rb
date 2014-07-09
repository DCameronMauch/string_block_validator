class Validator
  def validate(string)
    stack = []
    groupings = {
      '[' => { id: 1, type: :open },
      ']' => { id: 1, type: :close},
      '(' => { id: 2, type: :open },
      ')' => { id: 2, type: :close},
      '{' => { id: 3, type: :open },
      '}' => { id: 3, type: :close}
    }

    string.split(//).each{ |char|
      group = groupings[char]
      if group
        case group[:type]
        when :open
          stack.push group[:id]
        when :close
          if stack.last == group[:id]
            stack.pop
          else
            return false
          end
        end
      end
    }
    stack.empty?
  end
end
