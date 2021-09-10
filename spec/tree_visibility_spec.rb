require 'spec_helper'
require './tree_visibility'

describe Tree do
  describe '#solution' do
    let(:instance) { described_class.new }

    context 'given example' do
      it 'should return 4 given [5, [3, 20, 21], [10, 1, nil]]' do
        tree_l = TreeNode.new(3, TreeNode.new(21), TreeNode.new(20))
        tree_r = TreeNode.new(10, TreeNode.new(1))
        tree = TreeNode.new(5, tree_l, tree_r)

        subject = instance.solution(tree)
        expect(subject).to eq(4)
      end

      it 'should return 2 given [8, [2, 8, 7], 6]' do
        tree_l = TreeNode.new(2, TreeNode.new(8), TreeNode.new(7))
        tree_r = TreeNode.new(6)
        tree = TreeNode.new(8, tree_l, tree_r)

        subject = instance.solution(tree)
        expect(subject).to eq(2)
      end
    end

    context 'given equal' do
      it 'should return 3 given [1,1,1]' do
        tree = TreeNode.new(1, TreeNode.new(1), TreeNode.new(1))
        subject = instance.solution(tree)
        expect(subject).to eq(3)
      end
    end

    context 'given negative tree' do
      it 'should return 4 given [-3, [1, [1, -4, nil], 2], [-2, -3, -5]]' do
        tree_l_l = TreeNode.new(1, TreeNode.new(-4))
        tree_l = TreeNode.new(1, tree_l_l, TreeNode.new(2))

        tree_r = TreeNode.new(-2, TreeNode.new(-3), TreeNode.new(-5))
        tree = TreeNode.new(-3, tree_l, tree_r)

        subject = instance.solution(tree)
        expect(subject).to eq(5)
      end
    end

    context 'given empty tree' do
      it 'should return 0' do
        tree = TreeNode.new(nil)
        subject = instance.solution(tree)
        expect(subject).to eq(0)
      end
    end
  end
end
