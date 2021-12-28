import graphene
from graphene_django import DjangoObjectType
from .models import Member, Club

class MemberType(DjangoObjectType):
    class Meta:
        model = Member
        
class ClubType(DjangoObjectType):
    class Meta:
        model = Club
        
class Query(graphene.ObjectType):
    members = graphene.List(MemberType)
    member = graphene.Field(MemberType, id=graphene.Int())
    clubs = graphene.List(ClubType)
    
    def resolve_members(self, info, **kwargs):
        return Member.objects.all()
    
    def resolve_member(self, info, **kwargs):
        id = kwargs.get('id')
        return Member.objects.get(pk=id)
    
    def resolve_clubs(self, info, **kwargs):
        return Club.objects.all()