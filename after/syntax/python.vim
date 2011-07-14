syn region pythonComment
      \ start=+\(:\n[\t ]*\)\@<=\z('''\|"""\)+ end=+\z1+ keepend
      \ contains=pythonEscape,pythonTodo,@Spell
