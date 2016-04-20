module Concerns::SentryConfigs
  def set_raven_context
    Raven.user_context(id: current_user.id) if current_user
    Raven.extra_context(params: params.to_hash, url: request.url)
  end
end
