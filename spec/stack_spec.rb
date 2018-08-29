require 'spec_helper'

RSpec.describe Stack do
  let(:stack) { Stack.new }

  describe "#push" do
    subject { stack.push 1 }
    it { expect(subject).to eq stack }
    it "lengthが1増える" do
      expect{ subject }.to change{ stack.length }.by 1
    end
    it "1が追加される" do
      subject
      expect(stack.include? 1).to be_truthy
    end
  end

  describe "#pop" do
    subject { stack.pop 1 }
    before(:each) { stack.push 1 }
    context "1 を push 済みの stack" do
      it { expect(subject).to eq stack }
      it "length が 1 減る" do
        expect{ subject }.to change{ stack.length }.by -1
      end
      it "1 が 削除される" do
        subject
        expect(stack.exclude? 1).to be_truthy
      end
    end
    context "1 と 5 を push 済みの stack" do
      before { stack.push 5 }
      it "length が 1 減る" do
        expect{ subject }.to change{ stack.length }.by -1
      end
      it "5 が削除される" do
        subject
        expect(stack.exclude? 5).to be_truthy
      end
    end
  end

  describe "#length" do
    subject { stack.length }
    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to eq 1 }
    end
    context "1 と 5 を push 済みの stack" do
      before do
        stack.push 1
        stack.push 5
      end
      it { expect(subject).to eq 2 }
    end
  end

  describe "#empty?" do
    subject { stack.empty? }
    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to be_falsey }
    end
    context "空の stack" do
      it { expect(subject).to be_truthy }
    end
  end

  describe "#include?" do
    subject { stack.include? 1 }
    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to be_truthy }
    end
    context "空の stack" do
      it { expect(subject).to be_falsey }
    end
  end

  describe "#exclude?" do
    subject { stack.exclude? 1 }
    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to be_falsey }
    end
    context "空の stack" do
      it { expect(subject).to be_truthy }
    end
  end

  describe "#index" do
    subject { stack.index 1 }
    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to eq 0 }
    end
    context "2 を push 済みの stack" do
      before { stack.push 2 }
      it { expect(subject).to be nil }
    end
    context "空の stack" do
      it { expect(subject).to be nil }
    end
  end

  describe "#peek" do
    subject { stack.peek }
    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to eq 1 }
    end
    context "1 と 5 を push 済みの stack" do
      before { stack.push 1 }
      before { stack.push 5 }
      it { expect(subject).to eq 5 }
    end
    context "空の stack" do
      it { expect(subject).to be nil }
    end
  end
end