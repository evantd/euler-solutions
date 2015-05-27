# Convert a binary tree to a doubly linked list.
# Run it here: http://coffeescript.org/#try:%23%20paste%20code%20here

# This problem was posed to me by Facebook on 2015-05-21.

class TreeNode
  # value: null # Object or whatever
  # left: null # TreeNode for left subtree
  # right: null # TreeNode for right subtree
  toList: -> # O(n): Tree accesses are O(log n), but traversals don't have to "find" each node.
    curListNode = new ListNode
    curListNode.value = @value
    curListNode.prev = null
    curListNode.next = null

    curList = new List
    curList.first = curListNode
    curList.last = curListNode

    if @left?
      leftList = @left.toList()
      curList.first = leftList.first
      leftList.last.next = curListNode
      curListNode.prev = leftList.last

    if @right?
      rightList = @right.toList()
      curList.last = rightList.last
      rightList.first.prev = curListNode
      curListNode.next = rightList.first

    curList

class ListNode
  # value: null # Object or whatever
  # prev: null # previous ListNode
  # next: null # next ListNode

class List
  # first: null # first ListNode
  # last: null # last ListNode

#    d
#  b   f
# a c e g
root = new TreeNode
root.value = 'd'
root.left = new TreeNode
root.left.value = 'b'
root.left.left = new TreeNode
root.left.left.value = 'a'
root.left.right = new TreeNode
root.left.right.value = 'c'
root.right = new TreeNode
root.right.value = 'f'
root.right.left = new TreeNode
root.right.left.value = 'e'
root.right.right = new TreeNode
root.right.right.value = 'g'

output = ''
curListNode = root.toList().first
while curListNode?
  output += curListNode.value
  curListNode = curListNode.next
console.log(output)
