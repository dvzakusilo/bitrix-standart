;(function() {
	"use strict";

	BX.ready(function() {
		if (BX.Landing.getMode() !== "edit")
		{
			// Init template Fancybox wrapper
			$.HSCore.components.HSPopup.init(".js-fancybox");

			// Init Fancybox for link without embed URL
			$("[target=\"_popup\"]:not([data-url])").fancybox({type: "iframe"});

			// Init Fancybox for link with embed URL
			$("[target=\"_popup\"][data-url]").on("click", function(event) {
				event.preventDefault();

				$.fancybox.open({
					src: this.dataset.url,
					type: "iframe",
					afterShow: afterFancyboxIframeShow
				},
				{
					iframe: {
						scrolling : "auto"
					}
				});
			});

			$("[data-pseudo-url*='_popup']").on("click", function(event) {
				event.preventDefault();

				var linkOptions = BX.Landing.Utils.data(this, "data-pseudo-url");

				if (linkOptions.href)
				{
					$.fancybox.open({
							src: linkOptions.href,
							type: "iframe",
							afterShow: afterFancyboxIframeShow
						},
						{
							iframe: {
								scrolling : "auto"
							}
						});
				}

			});
		}

		function afterFancyboxIframeShow(instance, current)
		{
			var iframe = current.$slide.find("iframe")[0];
			void BX.Landing.MediaPlayer.Factory.create(iframe);
		}
	});

})();