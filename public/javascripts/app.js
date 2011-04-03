jQuery(document).ready(function() {
  // Uncomment one at a time to see the examples
 // var chess1 = jQuery('#board1').chess();
 // var chess2 = jQuery('#board2').chess({fen : "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2"});
  var chess = jQuery('#board3').chess({pgn : jQuery('#pgn-fischer-spassky').html()});
 // var chess4 = jQuery('#board4').chess({pgn : jQuery('#justdoeet').html()});
 // var chess5 = jQuery('#board5').chess({pgn : jQuery('#with-queening').html()});
 // var chess6 = jQuery('#board6').chess({pgn : jQuery('#unambiguous-knight-move').html()});

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
  
  jQuery('#board-flip').click(function() {
    chess.flipBoard();
    return false;
  });  

 
  
})
