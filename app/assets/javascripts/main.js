
customAnimation = {

	init: function()
	{

	var $animationSlider = $('.homePageSlider'), // slider
		$animation = $('.animation_container'), // animation elements container
	tlAnimations, tlAnimation, tlCloudOneAnimationRepeat, tlCloudTwoAnimationRepeat, 
	tlCloudThreeAnimationRepeat;


	tlAnimation = new TimelineMax(); //set up main container start status
		tlAnimation
		.set($animation, {autoAlpha: 1});

	// timeline for each cloud	each animation loop
	tlCloudOneAnimationRepeat = new TimelineMax({repeat: -1, repeatDelay: 0.1});
	tlCloudTwoAnimationRepeat = new TimelineMax({repeat: -1, repeatDelay: 0.1});
	tlCloudThreeAnimationRepeat = new TimelineMax({repeat: -1, repeatDelay: 0.1});

	// clouds variables
	var cloudOne = $animation.find('.cloud1'),
		cloudTwo = $animation.find('.cloud2'),
		cloudThree = $animation.find('.cloud3');

	// cloud one animation loop
	tlCloudOneAnimationRepeat
	.add('cloudsStart')
	.fromTo(cloudOne, 10, {x: '25' }, {x: '-=150', ease: Power0.easeNone, y: 0})
	.fromTo(cloudOne, 10, {x: '-=150' }, {x: '25',ease: Power0.easeNone, y: 0 });

	// cloud two animation loop
	tlCloudTwoAnimationRepeat
	.fromTo(cloudTwo, 12, {x: '-=150' }, {x: '0', ease: Power0.easeNone, y: 0 }, 'cloudsStart')
	.fromTo(cloudTwo, 12, {x: '0' }, {x: '-=150' , ease: Power0.easeNone, y: 0});	

	// cloud three animation loop
	tlCloudThreeAnimationRepeat
	.add('cloudsStart')
	.fromTo(cloudThree, 15, {x: '0' }, {x: '-=50', ease: Power0.easeNone, y: 0 }, 'cloudsStart')
	.fromTo(cloudThree, 15, {x: '-=50' }, {x: '0', ease: Power0.easeNone, y: 0 });	


	// sun and title animation
	tlAnimations = new TimelineMax({repeat: 0, repeatDelay: 2});

	var	elementOne = $animation.find('.sun'),
		elementTwo = $animation.find('.slider-title');


	tlAnimations
		.fromTo(elementOne, 1, {autoAlpha: 0, yPercent: 50 }, {autoAlpha: 1, yPercent: 1, ease:Power4.easeOut})
		.fromTo(elementTwo, 1, {autoAlpha: 0, yPercent: 50}, {autoAlpha: 1, yPercent: 0, ease:Power4.easeOut}, '-=0.7')
	} // end init


}; //end cuntomAnimation




$( document ).ready(function() {

	customAnimation.init();

}); // end ready function


$( document ).on("page:load", function() {

	customAnimation.init();

}); // end ready function
