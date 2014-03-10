%% Control Latch

% PD2 PD1  MODE
%   x   0  Normal Operation
%   0   1  Async Power-Down
%   1   1  Sync Power-Down
PD=bi2de([0 0], 'left-msb');

% CPI6 CPI5 CPI4  ICP
% CPI3 CPI2 CPI1
%    0    0    0  0.31
%    0    0    1  0.62
%    0    1    0  0.93
%    0    1    1  1.25
%    1    0    0  1.56
%    1    0    1  1.87
%    1    1    0  2.18
%    1    1    1  2.50
CPI=bi2de([1 1 1 1 1 1], 'left-msb');

% PL2 PL1  Current  Tuned Load   50Ohm
%   0   0    3.5mA       -9dBm  -19dBm
%   0   1    5.0mA       -6dBm  -15dBm
%   1   0    7.5mA       -3dBm  -12dBm
%   1   1   11.0mA        0dBm  -9dBm
%
PL=bi2de([1 1], 'left-msb');

MTLD=1; % Mute Til Lock Detect

% Current Setting
% CPG=0 -> Current Setting 1(CPI1:3)
% CPG=1 -> Current Setting 2(CPI4:6)
CPG=0;

% CP Output
% CP=0 -> Normal
% CP=1 -> HiZ
CP=0;

% Phase Detector Polarity
% PDP=0 -> Negative
% PDP=1 -> Positive
PDP=1;

% DIVOUT Control
% D3 D2 D1  DIVOUT
%  0  0  0  DVDD
%  0  0  1  Lock Detect
%  0  1  0  N DIV
%  0  1  1  DVDD
%  1  0  0  R DIV
%  1  0  1  A/2 CNT
%  1  1  0  A CNT
%  1  1  1  DGND
D=bi2de([0 0 1], 'left-msb');

% Counter Operation
% CR=0 -> Normal
% CR=1 -> R, A, B Cnt Held in Reset
CR=0;

% PC2 PC1  Core Power Level
%   0   0  2.5mA
%   0   1  5mA(default)
%   1   0  7.5mA
%   1   1  10mA
PC=bi2de([0 1], 'left-msb');

ctrl_latch = PD*2^20 + CPI*2^14 + PL*2^12 + MTLD*2^11 + CPG*2^10 + CP*2^9 + PDP*2^8 + D*2^5 + CR*2^4 + PC*2^2;

%% N Counter Latch
% 13-Bit B Counter
B=5760;

% 5-Bit DIVOUT Counter
A=2;
n_cnt_latch = CPG*2^21 + B*2^8 + A*2^2 + 2;

%% R Counter Latch
% BSC2 BSC1  Band Select Clock Divider
%    0    0  1
%    0    1  2
%    1    0  4
%    1    1  8
BSC=bi2de([1 1], 'left-msb');

% Lock Detect Precision
% LDP = 0 -> 3 Cycles for LD
% LDP = 1 -> 5 Cycles for LD
LDP=1;

% ABP2 ABP1  Antibacklash Pulse Width
%    0    0  3.0ns
%    0    1  1.3ns
%    1    0  6.0ns
%    1    1  3.0ns
ABP=bi2de([0 0], 'left-msb');

% 14-Bit Reference Counter
R=480;
r_cnt_latch = BSC*2^20 + LDP*2^18 + ABP*2^16 + R*2^2 + 1;

r_cnt_latch_hex = dec2hex(r_cnt_latch,6);
ctrl_latch_hex = dec2hex(ctrl_latch,6);
n_cnt_latch_hex = dec2hex(n_cnt_latch,6);

sprintf('R CNT: %s', r_cnt_latch_hex)
sprintf('CTRL: %s', ctrl_latch_hex)
sprintf('N CNT: %s', n_cnt_latch_hex)

sprintf('[0x%s 0x%s 0x%s] [0x%s 0x%s 0x%s] [0x%s 0x%s 0x%s]', r_cnt_latch_hex(1:2), r_cnt_latch_hex(3:4), r_cnt_latch_hex(5:6), ctrl_latch_hex(1:2), ctrl_latch_hex(3:4), ctrl_latch_hex(5:6), n_cnt_latch_hex(1:2), n_cnt_latch_hex(3:4), n_cnt_latch_hex(5:6))