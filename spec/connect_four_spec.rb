require './lib/connect-four.rb'
require './lib/board.rb'

describe Board do 
    describe '#empty?' do
        subject(:game_board) { described_class.new()}

        context 'when board is empty' do
            it 'returns true if empty' do
                game_board.values = [
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
                ]
                expect(game_board.empty?).to be true
            end
        end

        context 'when board is not empty' do
            it 'returns false' do
                game_board.values = [['.','.','.','.','.','.','.'], ['.','.','.','.','.','.','.'], ['.','.','.','.','.','.','.'], ['0','0','0','0','.','.','.'], ['.','.','.','.','.','.','.'], ['.','.','.','.','.','.','.']]
               
                expect(game_board.empty?).to be false
            end
        end
    end

    describe '#won?' do
        subject(:game_board) { Board.new }

        context 'when 4 connect on a row' do
            it 'returns true' do
                game_board.values = [
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['0', '0', '0', '0', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.']
                ]
                expect(game_board.won?).to be true
            end
        end

        context 'when 4 connect on a column' do
            it 'returns true' do
                game_board.values = [['X','.','.','.','.','.','.'], ['X','.','.','.','.','.','.'], ['X','.','.','.','.','.','.'], ['X','.','.','.','.','.','.'], ['.','.','.','.','.','.','.'], ['.','.','.','.','.','.','.']]
                expect(game_board.won?).to be true
            end
        end

        context 'when 4 connect on a diagonal' do
            it 'returns true' do
                game_board.values = [
                ['.', '.', '.', '.', '.', '.', '.'],
                ['.', '.', '.', '.', '.', '.', '.'],
                ['0', '.', '.', '.', '.', '.', '.'],
                ['.', '0', '.', '.', '.', '.', '.'],
                ['.', '.', '0', '.', '.', '.', '.'],
                ['.', '.', '.', '0', '.', '.', '.']
                ]
                expect(game_board.won?).to be true
            end
        end
    end

end