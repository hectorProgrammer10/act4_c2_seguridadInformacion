class UserData {
  String username;
  String email;
  String password;
  String readingHistory;
  String rewards;
  String social;
  String preferences;
  String usage;
  String ip;
  String device;

  UserData({
    required this.username,
    required this.email,
    required this.password,
    required this.readingHistory,
    required this.rewards,
    required this.social,
    required this.preferences,
    required this.usage,
    required this.ip,
    required this.device,
  });

  Map<String, String> toMap() => {
    'username': username,
    'email': email,
    'password': password,
    'readingHistory': readingHistory,
    'rewards': rewards,
    'social': social,
    'preferences': preferences,
    'usage': usage,
    'ip': ip,
    'device': device,
  };

  static UserData fromMap(Map<String, String> map) => UserData(
    username: map['username'] ?? '',
    email: map['email'] ?? '',
    password: map['password'] ?? '',
    readingHistory: map['readingHistory'] ?? '',
    rewards: map['rewards'] ?? '',
    social: map['social'] ?? '',
    preferences: map['preferences'] ?? '',
    usage: map['usage'] ?? '',
    ip: map['ip'] ?? '',
    device: map['device'] ?? '',
  );
}
