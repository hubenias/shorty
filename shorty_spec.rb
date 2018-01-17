require_relative 'shorty'
describe Shorty do
  subject { described_class}
  describe '.reduce' do
    it 'returns nil for nil' do
      expect(subject.reduce(nil)).to be_nil
    end

    it 'returns empty string for empty string' do
      expect(subject.reduce('')).to eq('')
    end

    context 'alphabetical range' do
      it 'replaces ranges with normal order' do
        expect(subject.reduce('abcddef')).to eq('a-dd-f')
      end

      it 'replaces ranges with reverse order' do
        expect(subject.reduce('feddcba')).to eq('f-dd-a')
      end

      it 'does not replace two letters range' do
        expect(subject.reduce('rs')).to eq('rs')
        expect(subject.reduce('ut')).to eq('ut')
      end
    end

    context 'digital range' do
      it 'replaces ranges with normal order' do
        expect(subject.reduce('012345')).to eq('0-5')
      end

      it 'replaces ranges with reverse order' do
        expect(subject.reduce('9876')).to eq('9-6')
      end
    end

    it 'replaces both numeric and letter ranges' do
      expect(subject.reduce('abcdab987612')).to eq('a-dab9-612')
    end

    it 'does not work with ranges in different cases' do
      expect(subject.reduce('aBc')).to eq('aBc')
    end
  end
end