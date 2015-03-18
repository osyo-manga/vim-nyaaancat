scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:V = vital#of("nyaaancat")
let s:Reunions = s:V.import("Reunions")
let s:Buffer = s:V.import("Coaster.Buffer")


function! nyaaancat#start(...)
	let opencmd = get(a:, 1, "new")
	let buffer = s:Buffer.open(opencmd)
	call buffer.set_option("number", 0)
	call buffer.set_option("foldenable", 0)
	call buffer.set_option("buftype", "nofile")
	call buffer.set_option("swapfile", 0)
	call buffer.setline(1, s:aa_list[0])
	call s:highlight()
	
	let task = {
\		"buffer" : buffer,
\		"counter" : 0
\	}
	function! task.apply(...)
		if !self.buffer.is_opened_in_current_tabpage()
			return
		endif
		let self.counter += 1
		call self.buffer.setline(1, s:aa_list[self.counter % len(s:aa_list)])
	endfunction
	call s:Reunions.timer(task, 0.1)
endfunction


augroup nyaaancat-autocmd
	autocmd!
	autocmd CursorHold,CursorHoldI * call s:Reunions.update_in_cursorhold(1)
augroup END


" original data
" https://github.com/koron/nyancat-vim
let s:aa_list = [
\		[
\			"",
\			"                  ''''''''''''''''''''''''''''''''''                ",
\			"                ''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@''              ",
\			"              ''@@@@@@$$$$$$$$$$$$$$$$$$$$$$$$$$@@@@@@''            ",
\			"              ''@@@@$$$$$$$$$$$$--$$$$--$$$$$$$$$$@@@@''            ",
\			"              ''@@$$$$--$$$$$$$$$$$$$$$$$$$$$$$$$$$$@@''            ",
\			"              ''@@$$$$$$$$$$$$$$$$$$$$''''$$$$--$$$$@@''  ''''      ",
\			"              ''@@$$$$$$$$$$$$$$$$$$''****''$$$$$$$$@@''''****''    ",
\			"  ''''''''    ''@@$$$$$$$$$$$$--$$$$''******''$$$$$$@@''******''    ",
\			"  ''****''''  ''@@$$$$$$$$$$$$$$$$$$''********''''''''********''    ",
\			"  ''''****''''''@@$$$$$$--$$$$$$$$$$''************************''    ",
\			"    ''''****''''@@$$$$$$$$$$$$$$--''****************************''  ",
\			"      ''''****''@@$$--$$$$$$$$$$$$''******..''**********..''****''  ",
\			"        ''''''''@@$$$$$$$$$$$$$$$$''******''''******''**''''****''  ",
\			"            ''''@@$$$$$$$$$$--$$$$''**%%%%******************%%%%''  ",
\			"              ''@@@@$$--$$$$$$$$$$''**%%%%**''****''****''**%%%%''  ",
\			"              ''@@@@@@$$$$$$$$$$$$$$''******''''''''''''''****''    ",
\			"            ''''''@@@@@@@@@@@@@@@@@@@@''********************''      ",
\			"          ''******''''''''''''''''''''''''''''''''''''''''''        ",
\			"          ''****''''  ''****''          ''****''  ''****''          ",
\			"          ''''''''    ''''''              ''''''    ''''            ",
\			""
\		],
\		[
\			"                                                                          ",
\			"                   ''''''''''''''''''''''''''''''''''                     ",
\			"                 ''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@''                   ",
\			"               ''@@@@@@$$$$$$$$$$$$$$$$$$$$$$$$$$@@@@@@''                 ",
\			"               ''@@@@$$$$$$$$$$$$--$$$$--$$$$$$$$$$@@@@''                 ",
\			"               ''@@$$$$--$$$$$$$$$$$$$$$$$$$$$$$$$$$$@@''                 ",
\			"               ''@@$$$$$$$$$$$$$$$$$$$$$$''''$$--$$$$@@''    ''''         ",
\			"               ''@@$$$$$$$$$$$$$$$$$$$$''****''$$$$$$@@''  ''****''       ",
\			"               ''@@$$$$$$$$$$$$--$$$$$$''******''$$$$@@''''******''       ",
\			"     ''''      ''@@$$$$$$$$$$$$$$$$$$$$''********''''''''********''       ",
\			"   ''****''    ''@@$$$$$$--$$$$$$$$$$$$''************************''       ",
\			"   ''****''''''''@@$$$$$$$$$$$$$$--$$''****************************''     ",
\			"     ''********''@@$$--$$$$$$$$$$$$$$''******..''**********..''****''     ",
\			"       ''''****''@@$$$$$$$$$$$$$$$$$$''******''''******''**''''****''     ",
\			"           ''''''@@$$$$$$$$$$--$$$$$$''**%%%%******************%%%%''     ",
\			"               ''@@@@$$--$$$$$$$$$$$$''**%%%%**''****''****''**%%%%''     ",
\			"               ''@@@@@@$$$$$$$$$$$$$$$$''******''''''''''''''****''       ",
\			"               ''''@@@@@@@@@@@@@@@@@@@@@@''********************''         ",
\			"             ''****''''''''''''''''''''''''''''''''''''''''''''           ",
\			"             ''****''  ''****''            ''****''  ''****''             ",
\			"             ''''''      ''''''              ''''''    ''''''             ",
\			""
\		],
\		[
\			"",
\			"                                                                       ",
\			"                  ''''''''''''''''''''''''''''''''''                   ",
\			"                ''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@''                 ",
\			"              ''@@@@@@$$$$$$$$$$$$$$$$$$$$$$$$$$@@@@@@''               ",
\			"              ''@@@@$$$$$$$$$$$$--$$$$--$$$$$$$$$$@@@@''               ",
\			"              ''@@$$$$--$$$$$$$$$$$$$$$$$$$$$$$$$$$$@@''               ",
\			"              ''@@$$$$$$$$$$$$$$$$$$$$$$''''$$--$$$$@@''    ''''       ",
\			"              ''@@$$$$$$$$$$$$$$$$$$$$''****''$$$$$$@@''  ''****''     ",
\			"              ''@@$$$$$$$$$$$$--$$$$$$''******''$$$$@@''''******''     ",
\			"              ''@@$$$$$$$$$$$$$$$$$$$$''********''''''''********''     ",
\			"              ''@@$$$$$$--$$$$$$$$$$$$''************************''     ",
\			"            ''''@@$$$$$$$$$$$$$$--$$''****************************''   ",
\			"      ''''''''''@@$$--$$$$$$$$$$$$$$''******..''**********..''****''   ",
\			"  ''''********''@@$$$$$$$$$$$$$$$$$$''******''''******''**''''****''   ",
\			"  ''******''''''@@$$$$$$$$$$--$$$$$$''**%%%%******************%%%%''   ",
\			"    ''''''''  ''@@@@$$--$$$$$$$$$$$$''**%%%%**''****''****''**%%%%''   ",
\			"              ''@@@@@@$$$$$$$$$$$$$$$$''******''''''''''''''****''     ",
\			"              ''''@@@@@@@@@@@@@@@@@@@@@@''********************''       ",
\			"              ''**''''''''''''''''''''''''''''''''''''''''''''         ",
\			"              ''****''  ''****''            ''****''  ''****''         ",
\			"              ''''''      ''''''              ''''''    ''''''         "
\		],
\		[
\			"                                                                       ",
\			"                                                                       ",
\			"                  ''''''''''''''''''''''''''''''''''                   ",
\			"                ''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@''                 ",
\			"              ''@@@@@@$$$$$$$$$$$$$$$$$$$$$$$$$$@@@@@@''               ",
\			"              ''@@@@$$$$$$$$$$$$--$$$$--$$$$$$$$$$@@@@''               ",
\			"              ''@@$$$$--$$$$$$$$$$$$$$$$$$$$$$$$$$$$@@''               ",
\			"              ''@@$$$$$$$$$$$$$$$$$$$$$$''''$$--$$$$@@''    ''''       ",
\			"              ''@@$$$$$$$$$$$$$$$$$$$$''****''$$$$$$@@''  ''****''     ",
\			"              ''@@$$$$$$$$$$$$--$$$$$$''******''$$$$@@''''******''     ",
\			"              ''@@$$$$$$$$$$$$$$$$$$$$''********''''''''********''     ",
\			"              ''@@$$$$$$--$$$$$$$$$$$$''************************''     ",
\			"          ''''''@@$$$$$$$$$$$$$$--$$''****************************''   ",
\			"      ''''****''@@$$--$$$$$$$$$$$$$$''******..''**********..''****''   ",
\			"    ''********''@@$$$$$$$$$$$$$$$$$$''******''''******''**''''****''   ",
\			"  ''****''''''''@@$$$$$$$$$$--$$$$$$''**%%%%******************%%%%''   ",
\			"  ''****''    ''@@@@$$--$$$$$$$$$$$$''**%%%%**''****''****''**%%%%''   ",
\			"    ''''      ''@@@@@@$$$$$$$$$$$$$$$$''******''''''''''''''****''     ",
\			"              ''''@@@@@@@@@@@@@@@@@@@@@@''********************''       ",
\			"            ''****''''''''''''''''''''''''''''''''''''''''''''         ",
\			"            ''****''  ''****''            ''****''  ''****''           ",
\			"            ''''''      ''''''              ''''''    ''''''           "
\		],
\		[
\			"                                                                     ",
\			"                                                                     ",
\			"                  ''''''''''''''''''''''''''''''''''                 ",
\			"                ''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@''               ",
\			"              ''@@@@@@$$$$$$$$$$$$$$$$$$$$$$$$$$@@@@@@''             ",
\			"              ''@@@@$$$$$$$$$$$$--$$$$--$$$$$$$$$$@@@@''             ",
\			"              ''@@$$$$--$$$$$$$$$$$$$$$$$$$$$$$$$$$$@@''             ",
\			"              ''@@$$$$$$$$$$$$$$$$$$$$''''$$$$--$$$$@@''  ''''       ",
\			"              ''@@$$$$$$$$$$$$$$$$$$''****''$$$$$$$$@@''''****''     ",
\			"              ''@@$$$$$$$$$$$$--$$$$''******''$$$$$$@@''******''     ",
\			"  ''''''''    ''@@$$$$$$$$$$$$$$$$$$''********''''''''********''     ",
\			"''******''''''''@@$$$$$$--$$$$$$$$$$''************************''     ",
\			"''''********''''@@$$$$$$$$$$$$$$--''****************************''   ",
\			"    ''''''''**''@@$$--$$$$$$$$$$$$''******..''**********..''****''   ",
\			"          ''''''@@$$$$$$$$$$$$$$$$''******''''******''**''''****''   ",
\			"              ''@@$$$$$$$$$$--$$$$''**%%%%******************%%%%''   ",
\			"              ''@@@@$$--$$$$$$$$$$''**%%%%**''****''****''**%%%%''   ",
\			"            ''''@@@@@@$$$$$$$$$$$$$$''******''''''''''''''****''     ",
\			"          ''''''''@@@@@@@@@@@@@@@@@@@@''********************''       ",
\			"        ''******''''''''''''''''''''''''''''''''''''''''''''         ",
\			"        ''****''  ''****''            ''****''  ''****''             ",
\			"        ''''''      ''''''              ''''''    ''''''             "
\		],
\		[
\			"                                                                    ",
\			"                                                                    ",
\			"                  ''''''''''''''''''''''''''''''''''                ",
\			"                ''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@''              ",
\			"              ''@@@@@@$$$$$$$$$$$$$$$$$$$$$$$$$$@@@@@@''            ",
\			"              ''@@@@$$$$$$$$$$$$--$$$$--$$$$$$$$$$@@@@''            ",
\			"              ''@@$$$$--$$$$$$$$$$$$$$''''$$$$$$$$$$@@''  ''''      ",
\			"              ''@@$$$$$$$$$$$$$$$$$$''****''$$--$$$$@@''''****''    ",
\			"              ''@@$$$$$$$$$$$$$$$$$$''******''$$$$$$@@''******''    ",
\			"    ''''      ''@@$$$$$$$$$$$$--$$$$''********''''''''********''    ",
\			"  ''****''    ''@@$$$$$$$$$$$$$$$$$$''************************''    ",
\			"  ''****''''''''@@$$$$$$--$$$$$$$$''****************************''  ",
\			"    ''********''@@$$$$$$$$$$$$$$--''******..''**********..''****''  ",
\			"      ''''****''@@$$--$$$$$$$$$$$$''******''''******''**''''****''  ",
\			"          ''''''@@$$$$$$$$$$$$$$$$''**%%%%******************%%%%''  ",
\			"              ''@@$$$$$$$$$$--$$$$''**%%%%**''****''****''**%%%%''  ",
\			"              ''@@@@$$--$$$$$$$$$$$$''******''''''''''''''****''    ",
\			"              ''@@@@@@$$$$$$$$$$$$$$$$''********************''      ",
\			"            ''**''@@@@@@@@@@@@@@@@@@@@@@''''''''''''''''''''        ",
\			"          ''******''''''''''''''''''''''''''''''''''**''            ",
\			"          ''****''  ''****''          ''****''  ''****''            ",
\			"          ''''''    ''''''            ''''''      ''''''            "
\		],
\	]


function! s:highlight()
	syntax clear
	syntax match uniteSource_nyancat_anim_gameBlock11 /,/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock11 guifg='#000080'
	highlight uniteSource_nyancat_anim_gameBlock11 guibg='#000080'
	highlight uniteSource_nyancat_anim_gameBlock11 ctermfg='1'
	highlight uniteSource_nyancat_anim_gameBlock11 ctermbg='1'
	syntax match uniteSource_nyancat_anim_gameBlock13 /\./ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock13 guifg='#ffffff'
	highlight uniteSource_nyancat_anim_gameBlock13 guibg='#ffffff'
	highlight uniteSource_nyancat_anim_gameBlock13 ctermfg='15'
	highlight uniteSource_nyancat_anim_gameBlock13 ctermbg='15'
	syntax match uniteSource_nyancat_anim_gameBlock6 /'/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock6 guifg='#000000'
	highlight uniteSource_nyancat_anim_gameBlock6 guibg='#000000'
	highlight uniteSource_nyancat_anim_gameBlock6 ctermfg='0'
	highlight uniteSource_nyancat_anim_gameBlock6 ctermbg='0'
	syntax match uniteSource_nyancat_anim_gameBlock21 /@/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock21 guifg='#fecc97'
	highlight uniteSource_nyancat_anim_gameBlock21 guibg='#fecc97'
	highlight uniteSource_nyancat_anim_gameBlock21 ctermfg='14'
	highlight uniteSource_nyancat_anim_gameBlock21 ctermbg='14'
	syntax match uniteSource_nyancat_anim_gameBlock3 /\$/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock3 guifg='#ff99ff'
	highlight uniteSource_nyancat_anim_gameBlock3 guibg='#ff99ff'
	highlight uniteSource_nyancat_anim_gameBlock3 ctermfg='13'
	highlight uniteSource_nyancat_anim_gameBlock3 ctermbg='13'
	syntax match uniteSource_nyancat_anim_gameBlock12 /-/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock12 guifg='#f9349e'
	highlight uniteSource_nyancat_anim_gameBlock12 guibg='#f9349e'
	highlight uniteSource_nyancat_anim_gameBlock12 ctermfg='12'
	highlight uniteSource_nyancat_anim_gameBlock12 ctermbg='12'
	syntax match uniteSource_nyancat_anim_gameBlock19 />/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock19 guifg='#ff0000'
	highlight uniteSource_nyancat_anim_gameBlock19 guibg='#ff0000'
	highlight uniteSource_nyancat_anim_gameBlock19 ctermfg='12'
	highlight uniteSource_nyancat_anim_gameBlock19 ctermbg='12'
	syntax match uniteSource_nyancat_anim_gameBlock5 /&/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock5 guifg='#ff9000'
	highlight uniteSource_nyancat_anim_gameBlock5 guibg='#ff9000'
	highlight uniteSource_nyancat_anim_gameBlock5 ctermfg='14'
	highlight uniteSource_nyancat_anim_gameBlock5 ctermbg='14'
	syntax match uniteSource_nyancat_anim_gameBlock10 /+/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock10 guifg='#ffff00'
	highlight uniteSource_nyancat_anim_gameBlock10 guibg='#ffff00'
	highlight uniteSource_nyancat_anim_gameBlock10 ctermfg='10'
	highlight uniteSource_nyancat_anim_gameBlock10 ctermbg='10'
	syntax match uniteSource_nyancat_anim_gameBlock2 /#/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock2 guifg='#33ff00'
	highlight uniteSource_nyancat_anim_gameBlock2 guibg='#33ff00'
	highlight uniteSource_nyancat_anim_gameBlock2 ctermfg='11'
	highlight uniteSource_nyancat_anim_gameBlock2 ctermbg='11'
	syntax match uniteSource_nyancat_anim_gameBlock18 /=/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock18 guifg='#0090ff'
	highlight uniteSource_nyancat_anim_gameBlock18 guibg='#0090ff'
	highlight uniteSource_nyancat_anim_gameBlock18 ctermfg='9'
	highlight uniteSource_nyancat_anim_gameBlock18 ctermbg='9'
	syntax match uniteSource_nyancat_anim_gameBlock16 /;/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock16 guifg='#6535fd'
	highlight uniteSource_nyancat_anim_gameBlock16 guibg='#6535fd'
	highlight uniteSource_nyancat_anim_gameBlock16 ctermfg='13'
	highlight uniteSource_nyancat_anim_gameBlock16 ctermbg='13'
	syntax match uniteSource_nyancat_anim_gameBlock9 /\*/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock9 guifg='#989898'
	highlight uniteSource_nyancat_anim_gameBlock9 guibg='#989898'
	highlight uniteSource_nyancat_anim_gameBlock9 ctermfg='8'
	highlight uniteSource_nyancat_anim_gameBlock9 ctermbg='8'
	syntax match uniteSource_nyancat_anim_gameBlock4 /%/ containedin=uniteSource_nyancat_anim
	highlight uniteSource_nyancat_anim_gameBlock4 guifg='#ff9898'
	highlight uniteSource_nyancat_anim_gameBlock4 guibg='#ff9898'
	highlight uniteSource_nyancat_anim_gameBlock4 ctermfg='13'
	highlight uniteSource_nyancat_anim_gameBlock4 ctermbg='13'
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
