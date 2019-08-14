class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", ( ele => {
      const $block = $(ele.currentTarget);
      this.makeMove($block);
    }));
  }

   makeMove($square) {
    const pos = $square.data("pos");
    const currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove(pos);
    } catch (error) {
      alert("This " + error.msg.toLowerCase());
      return;
    }
    $square.addClass(currentPlayer);

    if (this.game.isOver()) {
      this.$el.off("click");
      this.$el.addClass("game-over");

      const winner = this.game.winner();
      const $figcaption = $("<figcaption>");

      if (winner) {
        this.$el.addClass(`winner-${winner}`);
        $figcaption.html(`You win, ${winner}!`);
      } else {
        $figcaption.html("It's a draw!");
      }
      this.$el.append($figcaption);
    }
  }

  setupBoard() {
    const $ul = $("<ul>");
    for (let c = 0; c < 3; c++) {
      for (let r = 0; r < 3; r++) {
        let $li = $("<li>");
        $li.data("pos", [c,r]);
        $ul.append($li);
      }      
    }
    this.$el.append($ul);
  }
}

module.exports = View;
