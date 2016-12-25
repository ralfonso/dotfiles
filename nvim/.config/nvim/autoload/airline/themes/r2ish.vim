" based on airlineish https://github.com/paranoida/vim-airlineish

" Normal mode
let s:N1 = [ '#ffffff' , '#5f00af' , 15 , 55  ]
let s:N2 = [ '#ffffff' , '#875fd7' , 15 , 98  ]
let s:N3 = [ '#ffffff' , '#002b36' , 15 , 8 ]

" Insert mode
let s:I1 = [ '#ffffff' , '#005fff' , 15 , 33  ]
let s:I2 = [ '#ffffff' , '#00afff' , 15 , 39  ]
let s:I3 = [ '#ffffff' , '#002b36' , 15 , 8 ]

" Visual mode
let s:V1 = [ '#002b36' , '#ff5f00' , 233 , 202 ]
let s:V2 = [ '#002b36' , '#ffaf00' , 233 , 214 ]
let s:V3 = [ '#ffffff' , '#002b36' , 15  , 8 ]

" Replace mode
let s:R1 = [ '#ffffff' , '#ff0000' , 15 , 196 ]
let s:R2 = [ '#ffffff' , '#ff5f5f' , 15 , 203 ]
let s:R3 = [ '#ffffff' , '#002b36' , 15 , 8 ]

let g:airline#themes#r2ish#palette = {}
let g:airline#themes#r2ish#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#r2ish#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#r2ish#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#r2ish#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Inactive mode
let s:IN1 = [ '#9e9e9e' , '#626262' , 247 , 241 ]
let s:IN2 = [ '#ffffff' , '#002b36' , 15  , 8 ]

let s:IA = [ s:IN1[1] , s:IN2[1] , s:IN1[3] , s:IN2[3] , '' ]
let g:airline#themes#r2ish#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Tabline
let g:airline#themes#r2ish#palette.tabline = {
      \ 'airline_tab':     [ '#ffffff' , '#5f00af' ,  15 , 55  , '' ],
      \ 'airline_tabsel':  [ '#ffffff' , '#875fd7' ,  15 , 98  , '' ],
      \ 'airline_tabtype': [ '#ffffff' , '#875fd7' ,  15 , 98  , '' ],
      \ 'airline_tabfill': [ '#ffffff' , '#002b36' ,  15 , 8 , '' ],
      \ 'airline_tabmod':  [ '#ffffff' , '#ff5f5f' ,  15 , 33  , '' ]
      \ }
