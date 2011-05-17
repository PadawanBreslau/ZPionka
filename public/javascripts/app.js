jQuery(document).ready(function() {
  // Uncomment one at a time to see the examples
 // var chess1 = jQuery('#board1').chess();
 // var chess2 = jQuery('#board2').chess({fen : "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2"});
  var chess = jQuery('#board3').chess({pgn : jQuery('#pgn-jchess').html()});
 // var chess4 = jQuery('#board4').chess({pgn : jQuery('#justdoeet').html()});
 // var chess5 = jQuery('#board5').chess({pgn : jQuery('#with-queening').html()});
 // var chess6 = jQuery('#board6').chess({pgn : jQuery('#unambiguous-knight-move').html()});

  jQuery().keyup(function(event) {
   if(event.keyCode==39) chess.transitionForward();
   else if(event.keyCode==37) chess.transitionBackward();
  });

  jQuery('#board-back').click(function() {
    chess.transitionBackward();
    jQuery("#board-annot").text( chess.annotation() );
    return false;
  });
  
  jQuery('#board-next').click(function() {
    chess.transitionForward();
    jQuery("#board-annot").text( chess.annotation() );
    return false;
  });
  
  
 jQuery('#board-start').click(function() {
    chess.transitionToStart();
    jQuery("#board-annot").text( chess.annotation() );
    return false;
  });
  
  jQuery('#board-finish').click(function() {
    chess.transitionToFinish();
    jQuery("#board-annot").text( chess.annotation() );
    return false;
  });
  
  
  jQuery('#board-flip').click(function() {
    chess.flipBoard();
    return false;
  });  
  
  $('.goto-position').click(function() {
  	move = $(this).attr("data-move");
  	moveDifference = move-chess.game.halfmove_number
  	
  	if(moveDifference>0){
  	for(i=0;i<moveDifference;i++){
   	 chess.transitionForward(); }   	
  }
 else{
 	  for(i=0;i<-moveDifference;i++){
   	 chess.transitionBackward(); }
 }
 
    jQuery("#board-annot").text( chess.annotation() );
    return false;
  });



  
})
