package
{

	import flash.display.MovieClip;
	import com.oaxoa.fx.Branch;
	import flash.events.*
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.ColorTransform;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.geom.Matrix;
	
	


	public class test extends MovieClip
	{
		const w: uint = stage.stageWidth;
		const h: uint = stage.stageHeight;
		//private var label;
		private var renderView;
		private var ct: ColorTransform;
				private var matrix: Matrix;
		private var tt: Branch;
		private var timer: Timer;
		private var label: TextField;
			//private var renderView: BitmapData;
			private var bmp: Bitmap; 



		public function test()
		{
			//ct= new ColorTransform(1, 1, 1, 1, 1, 1, 1);
			//var renderView:BitmapData= new BitmapData(w, h, true);
			//bmp= new Bitmap(renderView);
			//addChild(bmp);

			//var tf: TextFormat = new TextFormat("_sans", 16, 0, true);
		//var	label:TextField = new TextField();
			///label.width = 400;
//label.defaultTextFormat = tf;
			//addChild(label);
			var timer: Timer = new Timer(10);
			timer.addEventListener(TimerEvent.TIMER, ontimer);
			timer.start(); // constructor code
		}
		function ontimer(event: TimerEvent): void
		{
			addNew();
		}
		function addNew(): void
		{
			//label.text = "Smoothness: " + String(mouseX - w / 2);
			var tt: Branch = new Branch(mouseX - w / 2);
			tt.x = stage.stageWidth / 2;
			tt.y = stage.stageHeight / 2;
			tt.addEventListener(Event.COMPLETE, oncomplete);
			addChild(tt);
			//renderView.colorTransform(renderView.rect, ct);
		}
		function oncomplete(event: Event): void
		{
			var t: Branch = event.currentTarget as Branch;
			var matrix: Matrix = new Matrix();
			matrix.translate(t.x, t.y);
			renderView.draw(t, matrix);
			removeChild(t);
			t.removeEventListener(Event.COMPLETE, oncomplete);
			t = null;
		}
	}
}