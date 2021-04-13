openMap true;

badApples = [];
onMapSingleClick {
	private _location = nearestLocation [_pos, ""];
	_badApples append [text _location];
	copyToClipboard str badApples;
};