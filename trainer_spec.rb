require 'simplecov'
SimpleCov.start
require './trainer.rb'

describe Trainer do
    context 'when not registered' do
        before do
          @trainer = Trainer.new
        end

        it 'can register' do
          expect {@trainer.register('Ignas Obulaitis', 'ignastreneris@gmail.com', 'password')}
            .to change { @trainer.registered? }.from(false).to(true)
        end
    end
end
