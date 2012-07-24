configuration = {
    :app_host => "example.com",
    :site_name => "PhotoMix",
    :site_description => "The Best Site!",
    :support_email => "support@example.com",
    :meta_description => 'A description of your site for use in META tags.',
    :meta_keywords => 'keywords for use in META tags',

    :userpic => {
        :paperclip_options => {
            :default_url => "http://lorempixel.com/87/86/people/",
            :styles => {
                :thumb => "100x100>",
                :small => "80x80>"
            },
            :url => "/system/:class/:attachment/:id/:style/:filename",
            :path => "public/system/:class/:attachment/:id/:style/:filename"
        },
        :validation_options => {
            :max_size => 1,
            :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png']
        }
    },

    :terms => 'Penatibus pulvinar nisi vel sed placerat tincidunt est scelerisque velit est dictumst.
    Aenean diam, scelerisque in cum eros? Dignissim phasellus phasellus pellentesque rhoncus risus tempor
    a ut nunc, sed porta hac porttitor auctor purus risus platea, tempor tortor, mus tincidunt vel magna.
    Tristique mid purus sit mattis elit, vut nunc turpis elementum scelerisque augue aenean magnis, eros magna placerat.
    Et urna nascetur, elementum porttitor egestas a amet tincidunt rhoncus porta sit lundium, enim, ut augue tortor
    ultricies magnis tristique sed egestas urna cum rhoncus penatibus porttitor tortor. Velit scelerisque odio! Adipiscing,
    dolor habitasse tincidunt dolor lundium, augue integer odio, ut, mauris integer, natoque placerat velit, velit, duis in,
    enim turpis, cursus magna lundium risus odio dignissim arcu porta urna? Enim.

    Tincidunt proin, ultrices ridiculus! Proin. Placerat et? Ut aenean, parturient porttitor?
    Duis egestas magnis montes, turpis, cursus, pulvinar diam, parturient placerat sociis turpis.
    Enim mid? Ultricies mauris sagittis facilisis adipiscing lectus pellentesque porttitor. Vel tincidunt, non ridiculus,
    in aenean aliquet dictumst pellentesque duis et massa diam tincidunt. Elementum? Odio, pid. Habitasse, urna,
    nascetur cursus magna facilisis mauris facilisis montes. Adipiscing egestas urna magna dignissim ac, pellentesque
    lectus. Porta adipiscing amet. Porta placerat montes mus, proin, sit cum vut et, elementum mid ut, dignissim
    natoque rhoncus urna dolor ridiculus? Egestas, enim pellentesque magna augue placerat eros? Urna dignissim lorem,
    mattis elementum. Integer porttitor pulvinar. Aenean ridiculus urna scelerisque et et quis purus duis aliquam eu eu
    nec dictumst, sagittis! Aliquam.

    Ac eu eros! Sed tincidunt, mattis etiam? Odio odio dignissim integer? Ut dictumst porttitor. Lectus turpis turpis
    in porta. Aenean ut diam mauris augue mattis ultricies est? Habitasse. Turpis? Parturient dictumst ut facilisis sit?
    Dapibus, dolor odio augue elementum porttitor eu nunc cras hac non dapibus facilisis? Pellentesque nec vut purus
    dignissim turpis, vut elementum? Ridiculus amet urna vel! Sed, in montes, dignissim rhoncus habitasse, parturient turpis?
    Natoque turpis sociis tortor, dignissim platea placerat, eu lundium duis amet cursus, tincidunt velit, rhoncus elementum,
    proin ut mus purus! Mid eros enim eros sed mid penatibus. A, sed sit. A ultrices ac eu! Tortor turpis aliquet odio,
    pellentesque vut sit dictumst nunc adipiscing. Augue amet aliquam rhoncus enim arcu velit sit.'


}

configatron.configure_from_hash(configuration)