!SLIDE title
# Testing with RSpec


!SLIDE bullets incremental
# \* Driven Development (\*DD)

* Test Driven Development (TDD) is common in the Ruby world:
    + Write the test for your method.
    + Run the test, watch it fail.
    + Implement functionality in the method.
    + Run the test, watch it pass.
* Behavior Driven Development (BDD) is not rare in Ruby-land:
    * Describe the behavior as a test.
    * Run the test, watch it fail.
    * for each method required: [GOTO TDD]
    * Implement behavior across app.
    * Run the test, watch it pass.


!SLIDE bullets text-size-90 incremental
# (Some) Test Approaches

* Unit
    * focus: small chunks of code, typically methods.
    * all dependencies are mocked.
* Functional
    * focus: feeding input & checking output of a subset of components.
    * dependencies mocked to control inputs.
* Integration
    * focus: integrating groups of components.
    * no dependencies mocked.
* Acceptance/Feature/Validation/Behavior
    * focus: user/customer requirements.
    * usually scenario based.
    * no dependencies mocked.


!SLIDE bullets incremental
# But what do I do?

* You should have enough--and no more-- **test coverage** to give you confidence
  your code does what you say it does.
* Right now we'll just talk about unit testing.


!SLIDE bullets
# RSpec Intro

* Why RSpec?
* RSpec...
    * is great for TDD and BDD.
    * has built-in mocking provisions.
    * will let you test at any level.
    * is very descriptive--it's a "spec"; reads like English.
    * implies organization.


!SLIDE bullets
# Basics

* Use `describe` to express the _thing_ you're spec'ing.
    * class
    * method
    * behavior
    * etc.
* Use `context` to express the _state_ the thing is operating in.
    * conditionals in the method?
    * behavior of external dependencies?
    * etc.


!SLIDE bullets
# Example!

* `my_outfit.rb`:

    ```ruby
    class MyOutfit
      attr_reader :pants
      def initialize
        @pants = [Pants.new, Pants.new]
      end
    end
    ```
* `my_outfit_spec.rb`:

    ```ruby
    describe MyOutfit do
      describe '#pants' do
        it "has 2 pairs" do
          expect(subject.pants.first).to be_a Pants
          expect(subject.pants.count).to eq 2
        end
      end
    end
    ```


!SLIDE bullets
# Example! (cont.)

* Run it!

    ```bash
    $ rspec --format=documentation --color my_thing_spec.rb

    MyOutfit
      #pants
        has 2 pairs

    Finished in 0.00089 seconds
    1 example, 0 failures
    ```


!SLIDE bullets
# Basics (cont.)

* I want to be able to change my outfit...

    ```ruby
    class MyOutfit
      attr_reader :pants

      def initialize
        @pants = new_pants
      end

      def change
        new_pants if @pants.size == 2
      end

      private

      def new_pants
        @pants = [Pants.new, Pants.new]
      end
    end
    ```


!SLIDE bullets
# Basics (cont.)

* Add specs for the new stuff...

    ```ruby
    describe MyOutfit do
      describe '#change' do
        context 'pants size is 2' do
          it "calls #new_pants" do
            subject.instance_variable_set(:@pants, [1, 2])
            expect(subject).to receive(:new_pants)
            subject.change
          end
        end

        context 'pants size is not 2' do
          it "does not call #new_pants" do
            subject.instance_variable_set(:@pants, [1])
            expect(subject).to_not receive(:new_pants)
            subject.change
          end
        end
      end
    end
    ```


!SLIDE
# What'd we just do?

* Used `describe` to express what `MyOutfit` and its methods should do.
* Used `context` to express how `#change` should behave when `MyOutfit` is in
  certain states.
* Used `subject` to represent the object we're describing.
* Used `it` to express how the `subject` should behave.
* Used `#instance_variable_set` to alter the state of the `subject`.
* Used `expect` to describe what should happen.


!SLIDE bullets
# More Basics

* Let's refactor those tests...

    ```ruby
    describe MyOutfit do
      describe '#change' do
        let(:fake_pants) { double 'Fake Pants' }

        context 'pants size is 2' do
          before do
            allow(fake_pants).to receive(:size).and_return 2
            subject.instance_variable_set(:@pants, fake_pants)
          end

          it "calls #new_pants" do
            expect(subject).to receive(:new_pants)
            subject.change
          end
        end

        # ...other spec...
      end
    end
    ```


!SLIDE bullets
# More Basics (cont.)

* ...and some more...

    ```ruby
    describe MyOutfit do
      describe '#change' do
        # ...other spec...

        context 'pants size is not 2' do
          before do
            allow(fake_pants).to receive(:size).and_return 1
            subject.instance_variable_set(:@pants, fake_pants)
          end

          it "does not call #new_pants" do
            expect(subject).to_not receive(:new_pants)
            subject.change
          end
        end
      end
    end
    ```


!SLIDE
# Now what'd we just do?

* Used `let` to set up an object to use in our specs.
* Created a "mock" or "double" object that we can explicitly control the behavior
  of.
* Used `allow` with the mocked `fake_pants` to stub the `#size` method and make
  it return `2`.
* Used `#instance_variable_set` again, but this time set it to our mock.
* Used a `before` block to set up the test.
    * This keeps the setup separate from the things we're testing for.


!SLIDE bullets
# Notables

* `allow` style stubbing is new.

    ```ruby
    allow(fake_pants).to receive(:size).and_return 1    # New
    fake_pants.stub(:size).and_return 1                 # Old
    ```
* `expect` for expectations is new.

    ```ruby
    expect(subject).to_not receive(:new_pants)          # New
    subject.should_not receive(:new_pants)              # Old
    ```
* `pending` is useful if you want to come back to a spec later.

    ```ruby
    it 'should do a barrel roll' do
      pending 'Implementation of #barrel_roll'
    end
    ```
* Files go in the `spec/` directory, mimicking your `lib/` files.


!SLIDE
# RSpec Summary

* Lets you describe an object's behavior in the various states that it can be.
* Lets you mock dependencies as needed.
* Lets you gain confidence your code does what you intend.
    * ...and shows others that it does what you intend.


!SLIDE questions center
# Questions?


!SLIDE bullets
# Homework!

* Add specs for each class and module in MusicDB.
* Instructions:
    * 1 spec file per class/module.
    * Check:
        * [these Relish docs](https://www.relishapp.com/rspec) for help.
        * The [built-in matchers](https://www.relishapp.com/rspec/rspec-expectations/v/2-14/docs/built-in-matchers).
        * [Method stubs](https://www.relishapp.com/rspec/rspec-mocks/v/2-14/docs/method-stubs).
    * Use git to commit and push your changes to Github.
