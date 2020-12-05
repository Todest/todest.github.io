<script src="//v1.hitokoto.cn/?encode=js&select=%23hitokoto" defer></script>
<style>
@media all and (orientation : portrait) {
	#hitokoto{
		padding-left: 50px;
		padding-right: 50px;
	}
}
</style>


{% if theme.fireworks %}
<canvas class="fireworks" style="position: fixed;left: 0;top: 0;z-index: 1; pointer-events: none;" ></canvas> 
<script type="text/javascript" src="//cdn.bootcss.com/animejs/2.2.0/anime.min.js"></script> 
<script type="text/javascript" src="//cdn.file.todest.cn/blog/js/fireworks.js"></script>
{% endif %}

{% if theme.clicklove %}
<script type="text/javascript" src="//cdn.file.todest.cn/blog/js/clicklove.js"></script>
{% endif %}

{% if theme.snow %}
<script type="text/javascript" src="//libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
var windowWidth = $(window).width();
if (windowWidth > 480) {
	document.write('<script type="text/javascript" src="//cdn.file.todest.cn/blog/js/snow_1.js"><\/script>');
}
</script>
{% endif %}

{% if theme.crash_cheat %}
<script type="text/javascript" src="//cdn.file.todest.cn/blog/js/crash_cheat.js"></script>
{% endif %}