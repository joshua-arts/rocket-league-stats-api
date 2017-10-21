RocketApiSchema = GraphQL::Schema.define do
  query Types::QueryType

  resolve_type ->(type, obj, ctx) do
  end

  use GraphQL::Batch
end
