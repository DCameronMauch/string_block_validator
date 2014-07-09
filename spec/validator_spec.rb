require_relative '../validator'

describe Validator do
  context 'identifies valid strings' do
    it 'identifies brackets as valid' do
      expect(subject.validate '[]').to be true
    end

    it 'identifies parenthesis as valid' do
      expect(subject.validate '()').to be true
    end

    it 'identifies brackets and parenthesis as valid' do
      expect(subject.validate '()[]').to be true
    end

    it 'identifies brackets inside parenthesis as valid' do
      expect(subject.validate 'a(b[c]d)e').to be true
    end
  end

  context 'identified invalid strings' do
    it 'identifies single bracket as invalid' do
      expect(subject.validate '[').to be false
    end

    it 'identifies single parenthesis as invalid' do
      expect(subject.validate ')').to be false
    end

    it 'identifies brackets overlapping paranthesis as invalid' do
      expect(subject.validate '[(])').to be false
    end
  end
end
