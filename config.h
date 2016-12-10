/* See LICENSE file for copyright and license details. */
#define NUMCOLORS         5
static const char colors[NUMCOLORS][MAXCOLORS][8] = {
  // border   foreground background
  { "#444444", "#bbbbbb", "#000000" },  // normal
  { "#005577", "#eeeeee", "#005577" },  // selected
  { "#ff0000", "#eeeeee", "#007722" },  // up
  { "#444444", "#eeeeee", "#772200" },  // down
  { "#444444", "#eeeeee", "#775e00" }  // middle
  // add more here
};
/* appearance */
static const char *fonts[] = {
	"monospace:size=8"
};
static const char dmenufont[]       = "monospace:size=8";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#000000";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#005577";
static const char selbgcolor[]      = "#005577";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

/* tagging */
static const char *tags[] = { "一", "二", "三", "四", "五", "六", "七", "八", "九" };

static const Rule rules[] = {
    /* xprop(1):
 *      *  WM_CLASS(STRING) = instance, class
 *           *  WM_NAME(STRING) = title
 *                */
    /* class      instance    title       tags mask     isfloating   monitor
 * */
    { "Gimp",     NULL,       NULL,       0,            1,           -1 },
};


/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/usr/bin/termite", "-e", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL};
static const char *termcmd[]  = { "termite", NULL };
static const char *teiler[] = {"teiler", NULL};
static const char *rofipass[] = {"rofi-pass", NULL};
static const char *volumeup[] = {"pamixer", "-i", "5", NULL};
static const char *volumedown[] = {"pamixer", "-d", "5", NULL};
static const char *volumemute[] = {"pamixer", "-t", NULL};
static const char *lockscreen[] = {"i3lock", "-p", "win", "-u", "-t", "-i", "/usr/share/i3lock/windows_10_small.png", NULL};
static const char *lockscreenh[] = {"i3lock", "-p", "win", "-u", "-t", "-i", "/usr/share/i3lock/windows_10.png", NULL};

#include "nextprevtag.c"

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
  { MODKEY,                       XK_s,      spawn,          {.v = teiler } },
  { MODKEY,                       XK_p,      spawn,          {.v = rofipass } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
  { MODKEY,                       XK_Right,  view_adjacent,  { .i = +1 } },
  { MODKEY,                       XK_Left,   view_adjacent,  { .i = -1 } },
  { MODKEY,                       XK_Up,     spawn,          {.v = volumeup} },
  { MODKEY,                       XK_Down,   spawn,          {.v = volumedown} },
  { MODKEY|ShiftMask,             XK_m,     spawn,          {.v = volumemute} },
  { MODKEY|ShiftMask,             XK_l,     spawn,          {.v = lockscreen} },
  { MODKEY|ShiftMask,             XK_h,     spawn,          {.v = lockscreenh} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
  { ClkTagBar,            0,              Button4,        view_adjacent,  { .i = -1 } },
  { ClkTagBar,            0,              Button5,        view_adjacent,  { .i = +1 } },
};

