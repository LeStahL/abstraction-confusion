; Music converted from petaldust.xrns 2021-08-20 10:52:03

%define MUSIC_LENGTH 576
%define TOTAL_SAMPLES 4259840
%define MAX_TOTAL_INSTRUMENT_SAMPLES 4325376

%define SAMPLES_PER_TICK 7350
%define TICKS_PER_SECOND 6.000000000

%define NUM_TRACKS_WITH_REVERB 0
%define NUM_TRACKS_WITHOUT_REVERB 6


	section iparam data align=4

_InstrumentParams:
.i00:
	; 00|VST: Oidos ()
	dd	18,47,58,27,0xBE4CCCC0,0x3F00001C,0xBF800000,0x3F800000,0x41BDD845,0x41E666D8,0x41ACCD94,0x3F800000,0xBE33D490,0x3C74A19E,0x3B76853D,0x3F972AE5,65536,0xB8C624A4,0x7F800000,0x46800000
.i01:
	; 01|VST: Oidos ()
	dd	41,24,50,100,0x3DE14844,0x3E947AF3,0xBF800000,0x3F800000,0x40231346,0xC2F00000,0x42E66689,0x3F800000,0xBF800000,0xA0E8FF69,0xA0E8FF69,0x40000000,65536,0xB91E83AC,0x7F800000,0x44A00000
.i02:
	; 02|VST: Oidos ()
	dd	24,39,10,24,0x00000000,0x3F800000,0x3F800000,0x3F800000,0x3C68A209,0xC1BFFFD6,0xC2F00000,0x3F40EA05,0x00000000,0x3C99A1E6,0x3D0B51DA,0x3F8B1B0B,131072,0xB7BE37C6,0x7F800000,0x45A00000
.i03:
	; 03|VST: Oidos ()
	dd	100,9,17,100,0x3CA3D480,0x3F7AE15C,0x3F800000,0xC00795BA,0x3E929533,0xC2F00000,0x42F00000,0x3F800000,0xBF800000,0xB49228F9,0x34920EE5,0x403CB50E,327680,0xB7C624B9,0x3A24A96A,0x46500000
.i04:
	; 04|VST: Oidos ()
	dd	85,10,3,28,0x3F07AE0E,0x3EF0A3E4,0x3F800000,0x3F000062,0x3C9ACB6F,0xC2F00000,0x42F00000,0x3F786583,0xBF800000,0xA10805CA,0xA10805CA,0x3F80002A,65536,0xB7CA5BF9,0x3C6832E0,0x44E00000
.i05:
	; 05|VST: Oidos ()
	dd	40,10,51,38,0x3D8F5B98,0x3F6E148D,0x3F800000,0xBFE24D72,0x3E303C74,0xC2F00000,0x42F00000,0x3F800000,0xBF800000,0xA0E8FF69,0xA0E8FF69,0x3F800027,262144,0xB7D4078B,0x382F6F5A,0x46B00000



	section itones data align=1

_InstrumentTones:
.i00:
	; 00|VST: Oidos ()
	db	36,-128
.i01:
	; 01|VST: Oidos ()
	db	2,-128
.i02:
	; 02|VST: Oidos ()
	db	11,4,8,4,-128
.i03:
	; 03|VST: Oidos ()
	db	35,4,3,4,1,4,2,1,4,3,2,2,1,-124
.i04:
	; 04|VST: Oidos ()
	db	51,2,3,2,1,4,2,1,2,-127
.i05:
	; 05|VST: Oidos ()
	db	58,3,2,3,2,2,-127


	section trdata data align=1

_TrackData:
.t_Kick_1:
	; Kick, column 1
	db	1,0,1,-128
.t_snare_1:
	; snare, column 1
	db	1,0,1,-128
.t_Track03_1:
	; Track 03, column 1
	db	0,0,1,1,1,1,1,1,1,-128
.t_pad_1:
	; pad, column 1
	db	0,0,1,1,1,4,1,2,1,1,1,-128
.t_pad_2:
	; pad, column 2
	db	0,2,1,1,1,1,1,1,1,3,1,-128
.t_pad_3:
	; pad, column 3
	db	0,3,1,3,1,2,1,3,1,-128
.t_pad_4:
	; pad, column 4
	db	0,5,1,2,1,3,1,2,1,-128
.t_pad_5:
	; pad, column 5
	db	0,9,1,1,1,-128
.t_bell_1:
	; bell, column 1
	db	2,0,1,1,1,1,1,1,1,2,1,2,1,-128
.t_bell_2:
	; bell, column 2
	db	2,4,1,2,1,2,1,-128
.t_lead_1:
	; lead, column 1
	db	0,0,1,1,1,1,1,1,1,1,1,-128
.t_lead_2:
	; lead, column 2
	db	0,3,1,2,1,-128

	section notelen data align=1

_NoteLengths:
	; Kick, column 1
L_Kick_1:
	db	-1,128
	; Position 2, pattern 2
	db	8,3,3,10,3,1,4,8,3,3,14,1,1,2
	; Position 3, pattern 3
	db	8,3,3,10,3,1,4,8,3,3,14,1,1,2
	; Position 4, pattern 4
	db	8,3,3,10,3,1,4,8,3,3,14,1,1,2
	; Position 5, pattern 5
	db	8,3,3,10,3,1,4,8,3,3,14,1,1,2
	; Position 6, pattern 6
	db	8,3,3,10,3,1,4,8,3,3,14,1,1,2
	; Position 7, pattern 7
	db	8,3,3,10,3,1,4,8,3,3
	db	0

	; snare, column 1
L_snare_1:
	db	-1,132
	; Position 2, pattern 2
	db	16,16,16,4,12
	; Position 3, pattern 3
	db	16,16,16,4,12
	; Position 4, pattern 4
	db	16,16,16,4,12
	; Position 5, pattern 5
	db	16,16,16,4,12
	; Position 6, pattern 6
	db	16,16,16,4,12
	; Position 7, pattern 7
	db	16,16
	db	0

	; Track 03, column 1
L_Track03_1:
	db	-1,128
	; Position 2, pattern 2
	db	8,3,3,10,4,4,8,3,3,10,4,4
	; Position 3, pattern 3
	db	8,3,3,10,4,4,8,3,3,10,4,4
	; Position 4, pattern 4
	db	8,3,3,10,4,4,8,3,3,10,4,4
	; Position 5, pattern 5
	db	8,3,3,10,4,4,8,3,3,10,4,4
	; Position 6, pattern 6
	db	8,3,3,10,4,4,8,3,3,10,4,4
	; Position 7, pattern 7
	db	8,3,3,10,4,4,8,3,3,10,4,4
	; Position 8, pattern 8
	db	8
	db	0

	; pad, column 1
L_pad_1:
	; Position 0, pattern 0
	db	32,32
	; Position 1, pattern 1
	db	2,30,32
	; Position 2, pattern 2
	db	1,27,4,32
	; Position 3, pattern 3
	db	2,30,32
	; Position 4, pattern 4
	db	1,27,4,32
	; Position 5, pattern 5
	db	2,30,32
	; Position 6, pattern 6
	db	1,27,4,32
	; Position 7, pattern 7
	db	2,30,32
	; Position 8, pattern 8
	db	1,23
	db	0

	; pad, column 2
L_pad_2:
	db	1,27,6,26,4
	; Position 1, pattern 1
	db	32,1,30,1
	; Position 2, pattern 2
	db	32,2,26,4
	; Position 3, pattern 3
	db	32,1,30,1
	; Position 4, pattern 4
	db	32,2,26,4
	; Position 5, pattern 5
	db	32,1,30,1
	; Position 6, pattern 6
	db	32,2,26,4
	; Position 7, pattern 7
	db	32,1,30,1
	; Position 8, pattern 8
	db	24
	db	0

	; pad, column 3
L_pad_3:
	db	3,22,10,22,10
	; Position 1, pattern 1
	db	28,4,28,4
	; Position 2, pattern 2
	db	22,10,22,10
	; Position 3, pattern 3
	db	28,4,28,4
	; Position 4, pattern 4
	db	22,10,22,10
	; Position 5, pattern 5
	db	28,4,28,4
	; Position 6, pattern 6
	db	22,10,22,10
	; Position 7, pattern 7
	db	28,4,28,4
	; Position 8, pattern 8
	db	21
	db	0

	; pad, column 4
L_pad_4:
	db	5,21,11,21,11
	; Position 1, pattern 1
	db	25,7,25,7
	; Position 2, pattern 2
	db	21,11,21,11
	; Position 3, pattern 3
	db	25,7,25,7
	; Position 4, pattern 4
	db	21,11,21,11
	; Position 5, pattern 5
	db	25,7,25,7
	; Position 6, pattern 6
	db	21,11,21,11
	; Position 7, pattern 7
	db	25,7,25,7
	; Position 8, pattern 8
	db	19
	db	0

	; pad, column 5
L_pad_5:
	db	56,6,62
	; Position 1, pattern 1
	db	3,57
	; Position 2, pattern 2
	db	6,62
	; Position 3, pattern 3
	db	3,57
	; Position 4, pattern 4
	db	6,62
	; Position 5, pattern 5
	db	3,57
	; Position 6, pattern 6
	db	6,62
	; Position 7, pattern 7
	db	3
	db	0

	; bell, column 1
L_bell_1:
	db	-1,128
	; Position 2, pattern 2
	db	4,6,6,4,6,6,4,6,6,4,6,4,2
	; Position 3, pattern 3
	db	4,6,6,4,6,6,4,6,6,4,6,4,2
	; Position 4, pattern 4
	db	4,6,6,4,6,6,4,6,6,4,6,4,2
	; Position 5, pattern 5
	db	4,6,6,4,6,6,4,6,6,4,6,4,2
	; Position 6, pattern 6
	db	4,6,6,4,6,6,4,6,6,4,6,4,2
	; Position 7, pattern 7
	db	4,6,6,4,6,6,4,6,6,4
	db	0

	; bell, column 2
L_bell_2:
	db	-1,140
	; Position 2, pattern 2
	db	16,16,16,16
	; Position 3, pattern 3
	db	16,16,16,16
	; Position 4, pattern 4
	db	16,16,16,16
	; Position 5, pattern 5
	db	16,16,16,16
	; Position 6, pattern 6
	db	16,16,16,16
	; Position 7, pattern 7
	db	16,16
	db	0

	; lead, column 1
L_lead_1:
	db	-2,0
	; Position 4, pattern 4
	db	24,8,16,16
	; Position 5, pattern 5
	db	24,8,16,16
	; Position 6, pattern 6
	db	24,8,16,16
	; Position 7, pattern 7
	db	24,8,16,16
	; Position 8, pattern 8
	db	0

	; lead, column 2
L_lead_2:
	db	-2,64
	; Position 5, pattern 5
	db	24,8,16,16
	; Position 6, pattern 6
	db	24,40
	; Position 7, pattern 7
	db	24,8,16,16
	; Position 8, pattern 8
	db	24
	db	0


	section notesamp data align=1

_NoteSamples:
	; Kick, column 1
S_Kick_1:
	db	0
	; Position 2, pattern 2
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; Position 3, pattern 3
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; Position 4, pattern 4
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; Position 5, pattern 5
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; Position 6, pattern 6
	db	1,1,1,1,1,1,1,1,1,1,1,1,1,1
	; Position 7, pattern 7
	db	1,1,1,1,1,1,1,1,1,1,1

	; snare, column 1
S_snare_1:
	db	0
	; Position 2, pattern 2
	db	1,1,1,1,1
	; Position 3, pattern 3
	db	1,1,1,1,1
	; Position 4, pattern 4
	db	1,1,1,1,1
	; Position 5, pattern 5
	db	1,1,1,1,1
	; Position 6, pattern 6
	db	1,1,1,1,1
	; Position 7, pattern 7
	db	1,1,1

	; Track 03, column 1
S_Track03_1:
	db	0
	; Position 2, pattern 2
	db	4,4,4,4,4,4,0,2,2,2,2,2
	; Position 3, pattern 3
	db	3,3,3,3,3,3,1,1,1,1,1,1
	; Position 4, pattern 4
	db	4,4,4,4,4,4,0,2,2,2,2,2
	; Position 5, pattern 5
	db	3,3,3,3,3,3,1,1,1,1,1,1
	; Position 6, pattern 6
	db	4,4,4,4,4,4,0,2,2,2,2,2
	; Position 7, pattern 7
	db	3,3,3,3,3,3,1,1,1,1,1,1
	; Position 8, pattern 8
	db	4,0

	; pad, column 1
S_pad_1:
	; Position 0, pattern 0
	db	3,2
	; Position 1, pattern 1
	db	0,4,1
	; Position 2, pattern 2
	db	0,5,0,2
	; Position 3, pattern 3
	db	0,4,1
	; Position 4, pattern 4
	db	0,5,0,2
	; Position 5, pattern 5
	db	0,4,1
	; Position 6, pattern 6
	db	0,5,0,2
	; Position 7, pattern 7
	db	0,4,1
	; Position 8, pattern 8
	db	0,5,0

	; pad, column 2
S_pad_2:
	db	0,5,0,2,0
	; Position 1, pattern 1
	db	3,0,1,0
	; Position 2, pattern 2
	db	4,0,2,0
	; Position 3, pattern 3
	db	3,0,1,0
	; Position 4, pattern 4
	db	4,0,2,0
	; Position 5, pattern 5
	db	3,0,1,0
	; Position 6, pattern 6
	db	4,0,2,0
	; Position 7, pattern 7
	db	3,0,1,0
	; Position 8, pattern 8
	db	4,0

	; pad, column 3
S_pad_3:
	db	0,4,0,2,0
	; Position 1, pattern 1
	db	3,0,1,0
	; Position 2, pattern 2
	db	4,0,2,0
	; Position 3, pattern 3
	db	3,0,1,0
	; Position 4, pattern 4
	db	4,0,2,0
	; Position 5, pattern 5
	db	3,0,1,0
	; Position 6, pattern 6
	db	4,0,2,0
	; Position 7, pattern 7
	db	3,0,1,0
	; Position 8, pattern 8
	db	4,0

	; pad, column 4
S_pad_4:
	db	0,4,0,2,0
	; Position 1, pattern 1
	db	3,0,1,0
	; Position 2, pattern 2
	db	4,0,2,0
	; Position 3, pattern 3
	db	3,0,1,0
	; Position 4, pattern 4
	db	4,0,2,0
	; Position 5, pattern 5
	db	3,0,1,0
	; Position 6, pattern 6
	db	4,0,2,0
	; Position 7, pattern 7
	db	3,0,1,0
	; Position 8, pattern 8
	db	4,0

	; pad, column 5
S_pad_5:
	db	0,1,0
	; Position 1, pattern 1
	db	2,0
	; Position 2, pattern 2
	db	1,0
	; Position 3, pattern 3
	db	2,0
	; Position 4, pattern 4
	db	1,0
	; Position 5, pattern 5
	db	2,0
	; Position 6, pattern 6
	db	1,0
	; Position 7, pattern 7
	db	2,0

	; bell, column 1
S_bell_1:
	db	0
	; Position 2, pattern 2
	db	3,3,6,2,2,5,1,1,4,1,1,4,5
	; Position 3, pattern 3
	db	3,3,6,2,2,5,1,1,4,1,1,4,5
	; Position 4, pattern 4
	db	3,3,6,2,2,5,1,1,4,1,1,4,5
	; Position 5, pattern 5
	db	3,3,6,2,2,5,1,1,4,1,1,4,5
	; Position 6, pattern 6
	db	3,3,6,2,2,5,1,1,4,1,1,4,5
	; Position 7, pattern 7
	db	3,3,6,2,2,5,1,1,4,1,1

	; bell, column 2
S_bell_2:
	db	0
	; Position 2, pattern 2
	db	3,2,1,1
	; Position 3, pattern 3
	db	3,2,1,1
	; Position 4, pattern 4
	db	3,2,1,1
	; Position 5, pattern 5
	db	3,2,1,1
	; Position 6, pattern 6
	db	3,2,1,1
	; Position 7, pattern 7
	db	3,2,1

	; lead, column 1
S_lead_1:
	db	0
	; Position 4, pattern 4
	db	4,3,2,1
	; Position 5, pattern 5
	db	0,5,0,1
	; Position 6, pattern 6
	db	0,3,2,1
	; Position 7, pattern 7
	db	0,5,0,1
	; Position 8, pattern 8
	db	0

	; lead, column 2
S_lead_2:
	db	0
	; Position 5, pattern 5
	db	1,0,2,0
	; Position 6, pattern 6
	db	1,0
	; Position 7, pattern 7
	db	1,0,2,0
	; Position 8, pattern 8
	db	1,0

