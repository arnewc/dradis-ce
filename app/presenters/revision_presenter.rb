class RevisionPresenter < BasePresenter
  presents :revision

  delegate :whodunnit, to: :revision

  def created_at_ago
    h.time_ago_in_words(revision.created_at) << ' ago'
  end

  def action
    if revision.event == 'create'
      revision.previous.present? ? 'Recovered' : 'Created'
    else # event can only be 'update' or 'destroy'
      revision.event.sub(/e?\z/, 'ed').capitalize
    end
  end

end
