if executable('ag')
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
elseif executable('ack')
  let g:unite_source_rec_async_command = ['ack', '-f', '--nofilter']
endif