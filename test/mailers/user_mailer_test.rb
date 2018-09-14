require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
   test "invite" do
    # Guardamos el email para futuros assertions
    email = UserMailer.create_invite('me@example.com',
                                     'friend@example.com', Time.now)

    # Enviar el email y verificar que fue encolado
    assert_emails 1 do
      email.deliver_now
    end

    # Verificar que el contenido es el esperado
    assert_equal ['me@example.com'], email.from
    assert_equal ['friend@example.com'], email.to
    assert_equal 'You have been invited by me@example.com', email.subject
  end
end
