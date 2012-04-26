" Vim syntax file
" Language:	PBASIC
" Maintianer:	Nicholas De Cicco
" Last Change:	Sunday, 6 September 2009
" Remark:	For PBASIC files.

" =============================================================================

" Copyright 2009 Nicholas De Cicco.
" All rights reserved.
"
" Redistribution and use, with or without modification, are permitted provided
" that redistributions retain the above copyright notice, this list of
" conditions and the following disclaimer.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
" ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
" TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
" PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
" CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
" EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
" PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
" OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
" OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
" ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

" =============================================================================

" see :help usr_44.txt
" see :help group-name

if exists("b:current_syntax")
  finish
endif

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax clear

" PBASIC doesn't have to be all-caps.
syntax case ignore

syntax keyword Conditional IF THEN ELSE ELSEIF ENDIF SELECT CASE ENDSELECT
syntax keyword Repeat DO LOOP FOR NEXT WHILE UNTIL
syntax keyword Type CON PIN VAR Bit Nib Byte Word
syntax keyword Keyword AUXIO BRANCH BUTTON COMPARE CONFIGPIN COUNT DATA DEBUG
syntax keyword Keyword DEBUGIN DTMFOUT EEPROM END EXIT FREQOT GET GOSUB GOTO
syntax keyword Keyword HIGH I2CIN I2COUT INPUT IOTERM LCDCMD LCDIN LCDOUT LET
syntax keyword Keyword LOOKDOWN LOOKUP LOW MAINIO NAP ON OUTPUT OWIN OWOUT
syntax keyword Keyword PAUSE POLLIN POLLMODE POLLOUT POLLRUN POLLWAIT POT
syntax keyword Keyword PULSIN PULSOUT PUT PWM RANDOM RCTIME READ RETURN REVERSE
syntax keyword Keyword RUN SERIN SEROUT SHIFTIN SHIFTOUT SLEEP SOND STOP STORE
syntax keyword Keyword TOGGLE WRITE XOUT
syntax keyword Operator AND OR NOT SIN COS ABS HYP ATN MIN MAX SQR DCD NCD

" Debug keywords.
syntax keyword Character CR HOME BELL BKSP TAB LF CLREOL CLRDN
syntax keyword Character CRSRXY CRSRLF CRSRRT CRSRUP CRSRDN CRSRX CRSRY

" Match #DEFINE #IF #THEN #ELSE #ENDIF #SELECT #CASE #ERROR
syntax match PreProc /#ERROR/
syntax match Define /#DEFINE.*$/
syntax match PreCondit /#\(IF.*#THEN\|SELECT.*$\|CASE.*$\)/
syntax match PreCondit /#\(ELSE\(IF.*#THEN\)\?\|ENDIF\|ENDSELECT\)/

syntax match String /"[^"]*"/
syntax match Function /^[^'"]*:/
syntax match Comment /'.*$/

syntax match PreProc /'[\t ]*{[\t ]*\$STAMP[\t ]\+BS\(1\|2e\?\|2p[ex]\?\|2sx\)[\t ]*}/
syntax match PreProc /'[\t ]*{[\t ]*\$PBASIC[\t ]\+\(1.0\|2.[05]\)[\t ]*}/
syntax match PreProc /'[\t ]*{[\t ]*\$PORT[\t ]\+COM[0-9][\t ]*}/
